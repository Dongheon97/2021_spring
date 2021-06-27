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
    <title>PREVIOUS_RENDTED</title>
</head>
<body>
<div class="container">
<!-- 대출했던 도서 목록을 보여준다 -->
    <h2 class="text-center">도서 대여 기록</h2>
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
                <th>대여 날짜</th>
                <th>반납 날짜</th>
            </tr>
        </thread>
        <tbody>
        <?php
$stmt = $conn -> 
    prepare("SELECT P.ISBN as ISBN, E.TITLE as BOOK_TITLE, A.AUTHOR AS AUTHOR, P.DATERENTED AS DATERENTED, P.DATERETURNED AS DATERETURNED 
    FROM PREVIOUS_RENTAL P, AUTHORS A, EBOOK E WHERE P.CNO = {$cno} AND A.ISBN = P.ISBN AND E.ISBN = A.ISBN  ");
$stmt -> execute();
while ($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
?>
        <tr>
        <!-- <a href="previous_rental.php=<?= $row['CNO'] ?>"></a> -->
            <td><?= $row['ISBN'] ?></td>
            <td><?= $row['BOOK_TITLE'] ?></td>
            <td><?= $row['AUTHOR'] ?></td>
            <td><?= $row['DATERENTED'] ?></td>
            <td><?= $row['DATERETURNED'] ?></td>
        </tr>
<?php
}
?>

<div class="d-grid d-md-flex justify-content-md-end">
        <a href="main.php" class="btn btn-primary">뒤로가기</a>
</div>
<!-- 대출 도서 목록을 보여준다 -->
<table class="table table-bordered text-center">
    <h2 class="text-center">대여 중인 도서</h2>
        <thread>
            <tr>
                <th>ISBN</th>
                <th>제목</th>
                <th>작가</th>
                <th>대여 날짜</th>
                <th>연장 횟수</th>
                <th>반납 예정일</th>
                <th>연장</th>
                <th>반납</th>
            </tr>
        </thread>
        <tbody>
        <?php
$stmt = $conn -> 
    prepare("SELECT E.ISBN as ISBN,  E.TITLE as BOOK_TITLE, A.AUTHOR AS AUTHOR, E.DATERENTED as RENTED, E.EXTTIMES AS EXTTIMES, E.DATEDUE AS DUE 
    FROM AUTHORS A, EBOOK E WHERE E.CNO = {$cno} AND E.ISBN = A.ISBN");
$stmt -> execute();
while ($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
    //if($row['cno'] > 0){
?>
        <tr>
            <td><?= $row['ISBN'] ?></td>
            <td><?= $row['BOOK_TITLE'] ?></td>
            <td><?= $row['AUTHOR'] ?></td>
            <td><?= $row['RENTED'] ?></td>
            <td><?= $row['EXTTIMES'] ?></td>
            <td><?= $row['DUE'] ?></td>
            <td><a href="extend_process.php?ISBN=<?= $row['ISBN'] ?>">연장하기</a></td>
            <td><a href="return_process.php?ISBN=<?= $row['ISBN'] ?>">반납하기</a></td>

        </tr>
<?php
    //}
}
?>

</html>
