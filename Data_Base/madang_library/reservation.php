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


try{
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <style>
        a {
            text-decoration: none;  
        }
    </style>
    <title>RESERVATION</title>
</head>
<body>
<div class="container">
<!-- 예약 도서 목록을 보여준다 -->
    <h2 class="text-center">책 예약 기록</h2>
    </tbody>
    </table>
    <form class="row">
    </form>
</div>
</body>
    <table class="table table-bordered text-center">
        <thread>
            <tr>
                <th>ISBN</th>
                <th>제목</th>
                <th>작가</th>
                <th>예약 날짜</th>
                <th>예약 취소</th>
            </tr>
        </thread>
        <tbody>
        <?php
$stmt = $conn -> 
    prepare("SELECT R.ISBN as ISBN, E.TITLE as BOOK_TITLE, A.AUTHOR AS AUTHOR, R.RESERVATIONTIME AS RESERVED FROM RESERVATION R, AUTHORS A, EBOOK E WHERE R.CNO = {$cno} AND A.ISBN = R.ISBN AND E.ISBN = A.ISBN  ");
$stmt -> execute();
while ($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
?>
        <tr>
            <td><?= $row['ISBN'] ?></td>
            <td><?= $row['BOOK_TITLE'] ?></td>
            <td><?= $row['AUTHOR'] ?></td>
            <td><?= $row['RESERVED'] ?></td>
            <td><a href="reservation_process.php?ISBN=<?= $row['ISBN'] ?>">취소하기</a></td>
        </tr>
<?php
}
?>

<div class="d-grid d-md-flex justify-content-md-end">
        <a href="main.php" class="btn btn-primary">뒤로가기</a>
</div>