<?php
$tns = "
    (DESCRIPTION = 
        (ADDRESS_LIST= (ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))
        (CONNECT_DATA= (SERVICE_NAME=XE))
    )
";
$dsn = "oci:dbname=".$tns.";charset=utf8";
$username = 'c##madang';
$password = 'madang';
$dbh = new PDO($dsn, $username, $password);

$for_commit = $dbh -> prepare('commit');

$stmt = $dbh -> prepare("INSERT INTO CUSTOMER(CNO, NAME, PASSWORD, EMAIL) VALUES (:cno, :name, :password, :email)");
$stmt -> bindParam(':cno', $cno);
$stmt -> bindParam(':name', $name);
$stmt -> bindParam(':password', $password);
$stmt -> bindParam(':email', $email);
$cno = $_POST['cno'];
$name = $_POST['name'];
$password = $_POST['password'];
$email = $_POST['email'];
$stmt -> execute();

if($stmt == false){
    echo "정상적으로 저장되지 않았습니다.";
}
else{
?>
<script>
    alert("회원가입에 성공했습니다.");
</script>
<?php
    $for_commit -> execute();
    header("Location: signin.php");
}
?>

