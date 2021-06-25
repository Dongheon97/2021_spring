<?php
session_destroy();
?>
<script>
    alert("로그아웃에 성공했습니다.");
</script>
<?php
header("Location: signin.php");
?>
