<?php
class UserModel {
    private $conn;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function register($username, $password, $email, $phone) {
        // Kiểm tra username hoặc email đã tồn tại chưa
        $sql_check = "SELECT * FROM accounts WHERE username = ? OR email = ?";
        $stmt_check = $this->conn->prepare($sql_check);
        $stmt_check->bind_param("ss", $username, $email);
        $stmt_check->execute();
        $result_check = $stmt_check->get_result();

        if ($result_check->num_rows > 0) {
            return "Tên đăng nhập hoặc email đã tồn tại.";
        }

        // Mã hóa mật khẩu
        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        // Thêm tài khoản vào database
        $sql_insert = "INSERT INTO accounts (username, password, email, phone) VALUES (?, ?, ?, ?)";
        $stmt_insert = $this->conn->prepare($sql_insert);
        $stmt_insert->bind_param("ssss", $username, $password_hash, $email, $phone);

        if ($stmt_insert->execute()) {
            return true; // Đăng ký thành công
        } else {
            return "Lỗi đăng ký: " . $stmt_insert->error;
        }
    }

    public function login($username, $password) {
        $sql = "SELECT account_id, username, password FROM accounts WHERE username = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row["password"])) {
                return $row; // Trả về thông tin người dùng
            } else {
                return "Mật khẩu không đúng.";
            }
        } else {
            return "Username không tồn tại.";
        }
    }
}
?>
