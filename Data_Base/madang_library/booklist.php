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
$searchWord = $_GET['searchWord'] ?? '';
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
    <title>BOOK_LIST</title>
</head>
<body>
<div class="container">
    <h2 class="text-center">책 리스트</h2>
    </tbody>
    </table>
    <form class="row">
        <div class="col-10">
            <label for="searchWord" class="visually-hidden">Search Word</label>
            <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색어 입력" value="<?= $searchWord ?>">
        </div>
        <div class="col-auto text-end">
            <button type="dubmit" class="btn btn-primary mb-3">검색</button>
        </div>
    </form>
</div>
</body>
    <table class="table table-bordered text-center">
        <thread>
            <tr>
                <th>ISBN</th>
                <th>제목</th>
                <th>작가</th>
                <th>출판사</th>
                <th>대출여부</th>                
            </tr>
        </thread>
        <tbody>
<?php
$stmt = $conn -> 
    //prepare("SELECT E.ISBN, E.TITLE, E.PUBLISHER, NVL2(E.DATEDUE, 'O', 'X') AS BORROW FROM EBOOK E WHERE LOWER(TITLE) LIKE '%' || :searchWord || '%' ORDER BY ISBN");
    prepare("SELECT E.ISBN, E.TITLE, E.PUBLISHER, A.AUTHOR, NVL2(E.DATEDUE, 'O', 'X') AS ISBORROWING FROM EBOOK E, AUTHORS A WHERE A.isbn = E.isbn AND LOWER(TITLE) LIKE '%' || :searchWord || '%' ORDER BY ISBN");
$stmt -> execute(array($searchWord));
while ($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
?>
        <tr>
            <td><a href="bookview.php?ISBN=<?= $row['ISBN'] ?>"><?= $row['ISBN'] ?></a></td>
            <td><?= $row['TITLE'] ?></a></td>
            <td><?= $row['AUTHOR'] ?></td>
            <td><?= $row['PUBLISHER'] ?></td>
            <td><?= $row['ISBORROWING'] ?></td>
        </tr>
<?php
}
?>
<div class="d-grid d-md-flex justify-content-md-end">
        <a href="input.php?mode=insert" class="btn btn-primary">등록</a>
</div>
</html>