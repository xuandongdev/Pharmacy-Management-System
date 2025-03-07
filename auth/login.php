<?php
session_start();
$error = $_SESSION['error'] ?? "";
unset($_SESSION['error']);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./login_regis.css">
    <title>Login</title>
</head>

<body>
    <div class="wrapper">
        <div class="form-header">
            <h2 class="title-login">Login</h2>
        </div>

        <?php if (!empty($error)) : ?>
            <p style="color: red; text-align: center;"><?= $error; ?></p>
        <?php endif; ?>

        <form action="../controller/AuthController.php" method="POST">
            <div class="input-box">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="input-field" required>
            </div>

            <div class="input-box">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="input-field" required>
            </div>

            <div class="input-box">
                <button type="submit" name="login" class="btn-submit">Login</button>
            </div>
        </form>

        <div class="switch-form">
            <span>Don't have an account? <a href="regis.php">Register</a></span>
        </div>
    </div>
</body>

</html>
