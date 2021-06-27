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

// 예약 되어있는지 -> 3번 미만인지 -> 체크
$isReservation = $conn -> prepare("SELECT COUNT(*) as COUNT FROM RESERVATION WHERE ISBN = {$ISBN}");
$isReservation -> execute();
$row = $isReservation -> fetch(PDO::FETCH_ASSOC);

$count = $row["COUNT"];

$isValid = $conn -> prepare("SELECT EXTTIMES FROM EBOOK WHERE ISBN = {$ISBN}");
$isValid -> execute();
$row = $isValid -> fetch(PDO::FETCH_ASSOC);

$extend = $row["EXTTIMES"];

if($count == 0){
    if( 0<=$extend && $extend<=2){
        $stmt = $conn -> prepare("UPDATE EBOOK SET EXTTIMES={$extend}+1, DATEDUE = DATEDUE + 10 WHERE ISBN = {$ISBN}");
        $stmt -> execute();

?>
        <script>
            alert("대출 기간 연장에 성공했습니다.");
        </script>
<?php
        header("LOCATION: previous_rental.php");
        echo "성공";
    }
    else{
?>
        <script>
            alert("연장횟수 3회가 초과되어 대출 기간을 연장할 수 없습니다.");
        </script>
<?php
        header("LOCATION: previous_rental.php");
        echo "실패 : extend";
    }
}
else{
    //echo "실패 : 예약됨";
?>
<script>
    alert('예약되어 있어 대출 기간을 연장할 수 없습니다.');
</script>

<?php
    header("LOCATION: previous_rental.php");
}
?>