<?php
session_start();
$tns = "
    (DESCRIPTION = 
        (ADDRESS_LIST= (ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))
        (CONNECT_DATA= (SERVICE_NAME=XE))
    )
";
$dsn = "oci:dbname".$tns.";charset=utf8";    
$username = 'c##madang';
$password = 'madang';
$cno = $_SESSION['cno'];
$ISBN = $_GET['ISBN'];


try{
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}

$for_commit = $conn -> prepare('commit');

if($ISBN > 0){
    $cancel = $conn -> prepare("DELETE FROM RESERVATION WHERE CNO = {$cno} AND ISBN = {$ISBN}");
    $cancel -> execute();
    
?>
    <script>
        alert("예약 취소에 성공했습니다.");
    </script>
<?php
    $for_commit -> execute();
    header("LOCATION: reservation.php");
}
?>
