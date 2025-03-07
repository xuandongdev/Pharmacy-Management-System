<?php
session_start();
require_once '../connect.php';

// Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    echo "<script>
            alert('Bạn cần đăng nhập để thay đổi thông tin.');
            window.location.href = '../auth/login.php';
        </script>";
    exit();
}

$account_id = $_SESSION['user_id'];
$sql = "SELECT * FROM accounts WHERE account_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $account_id);
$stmt->execute();
$result = $stmt->get_result();
$account = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa tài khoản</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Cập nhật thông tin tài khoản</h2>
    
    <?php if (isset($_SESSION['update_success'])): ?>
        <div class="alert alert-success"><?php echo $_SESSION['update_success']; unset($_SESSION['update_success']); ?></div>
    <?php endif; ?>

    <form action="update_profile.php" method="POST">
        <input type="hidden" name="account_id" value="<?php echo $account['account_id']; ?>">

        <div class="form-group">
            <label>Tên đăng nhập:</label>
            <input type="text" name="username" class="form-control" value="<?php echo htmlspecialchars($account['username']); ?>" required readonly>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="email" name="email" class="form-control" value="<?php echo htmlspecialchars($account['email']); ?>" required>
        </div>

        <div class="form-group">
            <label>Số điện thoại:</label>   
            <input type="text" name="phone" class="form-control" value="<?php echo htmlspecialchars($account['phone']); ?>">
        </div>

        <div class="form-group">
            <label>Mật khẩu mới (Để trống nếu không thay đổi):</label>
            <input type="password" name="password" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="../index.php" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
