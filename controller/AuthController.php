<?php
session_start();
require '../connect.php';
require '../model/UserModel.php';

class AuthController {
    private $userModel;

    public function __construct($db) {
        $this->userModel = new UserModel($db);
    }

    public function register() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $username = trim($_POST['username']);
            $email = trim($_POST['email']);
            $phone = trim($_POST['phone']);
            $password = trim($_POST['password']);
    
            if (empty($username) || empty($email) || empty($phone) || empty($password)) {
                echo "<script>alert('Vui lòng nhập đầy đủ thông tin.'); window.history.back();</script>";
                exit();
            }
    
            $result = $this->userModel->register($username, $password, $email, $phone);
            if ($result === true) {
                echo "<script>alert('Đăng ký thành công! Chuyển đến trang đăng nhập.'); window.location.href = '../auth/login.php';</script>";
                exit();
            } else {
                echo "<script>alert('$result'); window.history.back();</script>";
                exit();
            }
        }
    }
    

    public function login() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $username = trim($_POST['username']);
            $password = trim($_POST['password']);
    
            if (empty($username) || empty($password)) {
                echo "<script>alert('Vui lòng nhập username và mật khẩu.'); window.history.back();</script>";
                exit();
            }
    
            $user = $this->userModel->login($username, $password);
            if (is_array($user)) {
                $_SESSION["user_id"] = $user["account_id"];
                $_SESSION["username"] = $user["username"];
                echo "<script>alert('Đăng nhập thành công!'); window.location.href = '../dashboard/home/index.php';</script>";
                exit();
            } else {
                echo "<script>alert('$user'); window.history.back();</script>";
                exit();
            }
        }
    }
    
}

// Khởi tạo controller
$authController = new AuthController($conn);

// Xử lý yêu cầu đăng ký hoặc đăng nhập
if (isset($_POST['register'])) {
    $authController->register();
} elseif (isset($_POST['login'])) {
    $authController->login();
}
?>
