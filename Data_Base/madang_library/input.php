<?php
$ISBN = $_GET['ISBN'] ?? '';
$mode = $_GET['mode'] ?? '';
$title = '';
$year = '';
$author = '';
$publisher = '';

if ($mode == 'modify'){
    $tns = "
        (DESCRIPTION=
            (ADDRESS_LIST= (ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))
            (CONNECT_DATA= (SERVICE_NAME=XE))
        )
    ";
    $url = "oci:dbname=".$tns.";charset=utf8";
    $username = 'c##madang';
    $password = 'madang';
    try{
        $conn = new PDO($url, $username, $password);
    }catch (PDOException $e){
        echo ("에러 내용: ".$e -> getMessage());
    }              
    $stmt = $conn -> prepare("SELECT E.TITLE, A.AUTHOR, E.YEAR, E.PUBLISHER FROM EBOOK E, AUTHORS A WHERE A.ISBN = E.ISBN AND E.ISBN= :ISBN ");
    $stmt->execute(array($ISBN));
    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $title = $row ['TITLE'];
        $author = $row ['AUTHOR'];
        $year = $row ['YEAR'];
        $publisher = $row['PUBLISHER'];
    }
}
?>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width , initial-scale=1">
    <!--Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <style>
        a { 
            text-decoration: none;
        }
    </style>
    <title>Book_input</title>
</head>
<body>
<div class="container mb-3">
    <h2 class="display-4"><?= $mode == 'insert' ? '책 등록' : '책 수정'?></h2>
    <form class="row g-3 needs-validation" method="post" action="bookInfo_process.php?mode=<?= $mode ?>" novalidate>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" maxlength="50" id="title" name="title" placeholder="책 제목" value ="<?= $title ?>" required>
            <label for="title" class="form-label">제목</label>
            <div class="invalid-tooltip">제목을 입력하세요</div>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" maxlength="50" id="author" name="author" placeholder="작가" value ="<?= $author ?>" required>
            <label for="author" class="form-label">작가</label>
            <div class="invalid-tooltip">작가를 입력하세요</div>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" maxlength="10" id="year" name="year" placeholder="출판연도" value ="<?= $year ?>" required>
            <label for="year" class="form-label">출판 연도 (YY/MM/DD)</label>
            <div class="invalid-tooltip">출판 연도를 입력하세요</div>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" maxlength="50" id="publisher" name="publisher" placeholder="출판사" value ="<?= $publisher ?>" required>
            <label for="publisher" class="form-label">출판사</label>
            <div class="invalid-tooltip">출판사를 입력하세요</div>
        </div>
        <!-- 등록 버튼 -->
        <div class="mb-3">
            <input type="hidden" name="ISBN" value ="<?= $ISBN ?>">
            <button class="btn btn-primary" type="submit"><?= $mode == 'insert' ? '등록' : '수정'?></button>
        </div>
    </form>
</body>
<div class="d-grid d-md-flex justify-content-md-end">
        <a href="booklist.php" class="btn btn-primary">뒤로가기</a>
</div>
<script src="main.js"></script>
</html>