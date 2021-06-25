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
try{
    $dbh = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}

$input_cno = $_POST["cno"];
$input_password = $_POST["password"];

$stmt = $dbh -> prepare("SELECT * FROM CUSTOMER WHERE cno = $input_cno");
$stmt -> execute();


// select 문장을 가져온다. 
$row = $stmt -> fetch(PDO::FETCH_ASSOC);
if($row["CNO"] != 00000){
  if($row["PASSWORD"] == $input_password){
    $_SESSION['cno'] = $input_cno;
    $_SESSION['NAME'] = $row['NAME'];
    header("LOCATION: main.php");
  }
  else{
    echo "else?";
    //header("LOCATION: signin.php");
?>
    <script>
      alert("로그인 실패");
    </script>
<?php
    header("LOCATION: signin.php");
  }
}
// 관리자 계정으로 로그인 할 때,
else{
?>
    <script>
      alert("유효하지 않은 접근입니다.");
    </script>
<?php
    header("LOCATION: signin.php");
}
?>





