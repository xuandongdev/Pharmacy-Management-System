<?php
session_start();
require_once __DIR__ . '/../../connect.php';

$cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
$total = 0;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_cart'])) {
    foreach ($_POST['quantities'] as $id => $quantity) {
        if (isset($_SESSION['cart'][$id])) {
            $_SESSION['cart'][$id]['amount'] = max(1, intval($quantity));
        }
    }
    echo "<script>window.location.href='cart.php';</script>";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['checkout_cash'])) {
    if (!isset($_SESSION['user_id'])) {
        echo "<script>
        alert('Bạn cần đăng nhập để thanh toán.');
        window.location.href = '../auth/login.php';
        </script>";
        exit();
    }
    $customer_name = $_POST['customer_name'];
    $phone = $_POST['phone'];
    $address = $_POST['address'];

    echo "<script>
            alert('Giao dịch đã gửi đến: \\nTên: $customer_name \\nĐịa chỉ: $address \\nSố điện thoại: $phone \\nPhương thức: Thanh toán khi nhận hàng');
            window.location.href='drugstore.php';
        </script>";
    unset($_SESSION['cart']);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['checkout_qr'])) {
    if (!isset($_SESSION['user_id'])) {
        echo "<script>
                alert('Bạn cần đăng nhập để thanh toán.');
                window.location.href = '../auth/login.php';
            </script>";
        exit();
    }
        echo "<script>alert('Thanh toán qua mã QR thành công!'); window.location.href='drugstore.php';</script>";
        unset($_SESSION['cart']);
        exit();
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giỏ hàng - Nhà thuốc 24h</title>
    <link rel="stylesheet" href="drugstore.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .product-img {
            border-radius: 5px;
        }
    </style>
</head>

<body>
    <div class="container my-4">
        <h1 class="text-center">Giỏ hàng của bạn</h1>

        <?php if (empty($cart)): ?>
            <?php echo '<script>alert("Giỏ hàng của bạn trống."); window.location.href="drugstore.php";</script>' ?>
        <?php else: ?>
            <form method="POST">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Tên thuốc</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($cart as $id => $item):
                            $subtotal = $item['price'] * $item['amount'];
                            $total += $subtotal;
                            ?>
                            <tr>
                                <td><img class="product-img" src="<?php echo $item['image_url']; ?>"
                                        alt="<?php echo $item['name']; ?>" width="80"></td>
                                <td><?php echo $item['name']; ?></td>
                                <td>
                                    <input type="number" name="quantities[<?php echo $id; ?>]"
                                        value="<?php echo $item['amount']; ?>" min="1">
                                    <?php echo $item['unit']; ?>
                                </td>
                                <td><?php echo number_format($item['price'], 2); ?> VNĐ</td>
                                <td><?php echo number_format($subtotal, 2); ?> VNĐ</td>
                                <td><a href="remove-from-cart.php?id=<?php echo $id; ?>" class="btn btn-danger btn-sm">Xóa</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="4" class="text-right">Tổng cộng:</th>
                            <th colspan="2"><?php echo number_format($total, 2); ?> VNĐ</th>
                        </tr>
                    </tfoot>
                </table>
                <button type="submit" name="update_cart" class="btn btn-success">Cập nhật giỏ hàng</button>
            </form>

            <h3 class="mt-4">Chọn phương thức thanh toán</h3>
            <form method="POST">
                <select name="payment_method" id="payment_method" class="form-control" onchange="togglePaymentFields()">
                    <option value="qr">Quét mã QR</option>
                    <option value="cash">Tiền mặt</option>
                </select>

                <div id="cash_fields" style="display: none;" class="mt-3">
                    <label>Họ và tên:</label>
                    <input type="text" name="customer_name" class="form-control">
                    <label>Số điện thoại:</label>
                    <input type="text" name="phone" class="form-control">
                    <label>Địa chỉ:</label>
                    <input type="text" name="address" class="form-control">
                </div>

                <div class="text-center mt-3">
                    <a href="../checkout/checkout.php" class="btn btn-primary">Thanh toán QR</a>
                    <button type="submit" name="checkout_cash" class="btn btn-warning">Thanh toán tiền mặt</button>
                </div>
            </form>

            <div class="text-center my-4">
                <a href="drugstore.php" class="btn btn-secondary">Trở về</a>
            </div>
        <?php endif; ?>
    </div>
    <script>
        function togglePaymentFields() {
            let method = document.getElementById("payment_method").value;
            document.getElementById("cash_fields").style.display = (method === "cash") ? "block" : "none";
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>