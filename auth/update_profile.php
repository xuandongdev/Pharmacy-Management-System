<?php
session_start();
require_once '../connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $account_id = $_POST['account_id'];
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone']);
    $password = trim($_POST['password']);

    // Kiểm tra email có bị trùng không (trừ tài khoản hiện tại)
    $check_email_sql = "SELECT account_id FROM accounts WHERE email = ? AND account_id != ?";
    $stmt = $conn->prepare($check_email_sql);
    $stmt->bind_param("si", $email, $account_id);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $_SESSION['update_success'] = "Email đã được sử dụng!";
        header("Location: edit_profile.php");
        exit();
    }

    // Cập nhật thông tin
    if (!empty($password)) {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $update_sql = "UPDATE accounts SET email = ?, phone = ?, password = ? WHERE account_id = ?";
        $stmt = $conn->prepare($update_sql);
        $stmt->bind_param("sssi", $email, $phone, $hashed_password, $account_id);
    } else {
        $update_sql = "UPDATE accounts SET email = ?, phone = ? WHERE account_id = ?";
        $stmt = $conn->prepare($update_sql);
        $stmt->bind_param("ssi", $email, $phone, $account_id);
    }

    if ($stmt->execute()) {
        $_SESSION['update_success'] = "Cập nhật thông tin thành công!";
    } else {
        $_SESSION['update_success'] = "Lỗi cập nhật!";
    }

    header("Location: edit_profile.php");
    exit();
}
?>
