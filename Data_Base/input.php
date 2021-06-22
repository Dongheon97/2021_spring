<?php
$ISBN = $_GET['ISBN'] ?? '';
$mode = $_GET['mode'] ?? '';
$title = '';
$publisher = '';
if ($mode == 'modify'){
    $tns = "
        (DESCRIPTION=
            (ADDRESS_LIST= (ADDRESS=(PROTOCOL=TCP)(HOST=cnusdlab.synology.me)(PORT=1521)))
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
    $stmt = $conn -> prepare("SELECT TITLE, PUBLISHER FROM EBOOK WHERE ISBN= :ISBN ");
    $stmt->execute(array($ISBN));
    if ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $title = $row ['TITLE'];
        $publisher = $row['PUBILSHER'];
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
    <title>Book input</title>
</head>
<body>
<div class="container mb-3">
    <h2 class="display-4"><?= $mode == 'insert' ? '책 등록' : '책 수정'?></h2>
    <form class="row g-3 needs-validation" method="post" action="process.php?mode=<?= $mode ?>" novalidate>
    <div class="form-floating mb-3">
        <input type="text" class="form-control" maxlength="13" id="title" name="title" placeholder="책 제목" value ="<?= $title ?>" required>
        <label for="title" class="form-label">제목</label>
        <div class="invalid-tooltip">제목을 입력하세요</div>
    </div>
    <div clas="form-floating mb-3">
        <input type="text" class="form-control" maxlength="13" id="publisher" name="publisher" placeholder="출판사" value ="<?= $publisher ?>" required>
        <label for="publisher" class="form-label">출판사</label>
        <div class="invalid-tooltip">출판사를 입력하세요</div>
    </div>
    <div class="mb-3">
        <input type="hidden" name="bookId " value ="="<?= bookId
button class btn btn primary " type submit "">><?= mode == insert ' ? 등록 ' : 수정 button
div
form
body
script src main.js script
html