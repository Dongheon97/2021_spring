<?php
$tns = "
    (DESCRIPTION = 
        (ADDRESS_LIST= (ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))
        (CONNECT_DATA= (SERVICE_NAME=XE))
    )
";
$dsn = "oci:dbname".$tns.";charset=utf8";    
$username = 'c##madang';
$password = 'madang';
try{
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}

$cno_customer = $_POST['cno'];
$password_customer = $_POST['password'];

$stmt = $dsn -> prepare("SELECT CNO, password FROM CUSTOMER WHERE CNO = :CNO");
$stmt -> bindParam(':CNO', $cno_customer);
$stmt -> bindParam(':password', $password_db);
$cno_db = $_POST['CNO'];
$password_db = $_POST['password'];
$stmt -> execution();

if ($password_db == $password_customer){
    $_SESSION['cno'] = $row["CNO"];
    echo "성공";
}
else{
    echo "실패";
}
?>

