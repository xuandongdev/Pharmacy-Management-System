<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./login_regis.css">
    <title>Register</title>
</head>

<body>
    <div class="wrapper">
        <div class="form-header">
            <h2 class="title-register">Register</h2>
        </div>

        <form action="../controller/AuthController.php" method="POST" class="register-form" autocomplete="off">

            <div class="input-box">
                <input type="text" class="input-field" id="reg-fullname" name="fullname" required>
                <label for="reg-fullname" class="label">Full Name</label>
                <i class='bx bx-user-circle icon'></i>
            </div>

            <div class="input-box">
                <input type="text" class="input-field" id="reg-name" name="username" required>
                <label for="reg-name" class="label">Username</label>
                <i class='bx bx-user icon'></i>
            </div>

            <div class="input-box">
                <input type="email" class="input-field" id="reg-email" name="email" required>
                <label for="reg-email" class="label">Email</label>
                <i class='bx bx-envelope icon'></i>
            </div>

            <div class="input-box">
                <input type="text" class="input-field" id="reg-phone" name="phone" required>
                <label for="reg-phone" class="label">Phone</label>
                <i class='bx bx-phone icon'></i>
            </div>

            <div class="input-box">
                <input type="password" class="input-field" id="reg-pass" name="password" required>
                <label for="reg-pass" class="label">Password</label>
                <i class='bx bx-lock-alt icon'></i>
            </div>

            <div class="form-cols">
                <div class="col-1">
                    <input type="checkbox" id="agree" required>
                    <label for="agree"> I agree to terms & conditions</label>
                </div>
            </div>

            <div class="input-box">
                <button type="submit" name="register" class="btn-submit">Sign Up <i class='bx bx-user-plus'></i></button>
            </div>

            <div class="switch-form">
                <span>Already have an account? <a href="login.php">Login</a></span>
            </div>
        </form>
    </div>
</body>

</html>
