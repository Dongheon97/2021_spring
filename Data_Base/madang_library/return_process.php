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

$ready = $conn -> prepare("SELECT TO_CHAR(EBOOK.DATERENTED, 'YYMMDD') as DATERENTED FROM EBOOK WHERE ISBN = {$ISBN}");
$ready -> execute();
$row = $ready -> fetch(PDO::FETCH_ASSOC);

$rented = $row['DATERENTED'];



$update = $conn -> prepare("UPDATE EBOOK SET CNO = NULL, EXTTIMES = NULL, DATERENTED = NULL, DATEDUE = NULL WHERE ISBN = {$ISBN}");
$update -> execute();

$to_date = 'TO_DATE(\''.$rented.'\',\'yy/mm/dd\')';
echo $to_date;
$to_previous = $conn -> prepare("INSERT INTO PREVIOUS_RENTAL VALUES ({$ISBN}, {$to_date}, TO_CHAR(SYSDATE, 'YY/MM/DD'), {$cno}) ");
$to_previous -> execute();

?>
<script>
    alert("반납을 완료했습니다");
</script>
<?php 
header("LOCATION: previous_rental.php");
$for_commit -> execute();
?>