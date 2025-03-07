<?php 
session_start();
session_unset(); // Xóa tất cả biến session
session_destroy(); // Hủy toàn bộ session

echo '<script language="javascript">
    alert("Bạn đã đăng xuất thành công!");
    window.location="../../dashboard/home/index.php";
</script>';
exit();
?>
