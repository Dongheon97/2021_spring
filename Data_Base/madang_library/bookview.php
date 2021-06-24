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
$ISBN = $_GET['ISBN'];
try{
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}
$stmt = $conn -> prepare("SELECT E.ISBN, E.TITLE, A.AUTHOR, TO_CHAR(E.YEAR, 'YYYY.MM.DD') AS YYDDMM, E.PUBLISHER, NVL(TO_CHAR(E.DATEDUE, 'YYYY.MM.DD'), 'X') AS RESERVATION FROM EBOOK E, AUTHORS A WHERE E.ISBN = A.ISBN AND E.ISBN = ?");
$stmt -> execute(array($ISBN));
$title = '';
$author = '';
$publisher = '';
$year = '';
$reservation= '';
if ($row = $stmt -> fetch (PDO::FETCH_ASSOC)){
    $title = $row['TITLE'];    
    $author = $row['AUTHOR'];
    $publisher = $row['PUBLISHER'];
    $year = $row['YYDDMM'];
    $reservation = $row['RESERVATION'];
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity ="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <style>
        a { 
            text-decoration: none;
        }
    </style>
    <title>BOOK_VIEW</title>
</head>
<body>
<div class="container">
    <h2 class="display-6">상세 화면</h2>
    <table class="table table-bordered text-center">
        <tbody>
            <tr>
                <td>ISBN</td>
                <td><?= $ISBN ?></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><?= $title ?></td>
            </tr>
            <tr>
                <td>작가</td>
                <td><?= $author ?></td>
            </tr>
            <tr>
                <td>출판사</td>
                <td><?= $publisher ?></td>
            </tr>
            <tr>
                <td>출판 연도</td>
                <td><?= $year ?></td>
            </tr>
            <tr>
                <td>반납 예상일</td>
                <td><?= $reservation ?></td>
            </tr>
        </tbody>
    </table>
<?php
}
?>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <a href="booklist.php" class="btn btn-success">목록</a>
        <a href="input.php?ISBN=<?= $ISBN ?>&mode=modify" class="btn btn-warning">수정</a>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">삭제</button>
    </div>
</div>
<!--Delete Confirm Modal-->
<div class="modal fade" id="deleteConfirmModal" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteConfirmModalLabel"><?= $title ?></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                위의 책을 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <form action="process.php?mode=delete" method="POST" class="row">
                    <input type="hidden" name="ISBN" value="<?= $ISBN ?>">
                    <button type="submit" class="btn btn-danger">삭제</button>
                </form>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</html>
