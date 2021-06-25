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
try{
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}
$search_title = '';
$search_author = '';
$search_publisher = '';
$search_year = '';
$first_op = '';
$second_op = '';
$third_op = '';
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
    <title>SEARCHED BOOKS</title>
</head>
<body>
<div class="container">
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
                <th>출판사</th>
                <th>대출여부</th>                
            </tr>
        </thread>
        <tbody>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        a {
            text-decoration: none;  
        }
    </style>
    <title>SEARCH</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>
</head>

<body>
<div class="container">
    <h2 class="text-center">도서 검색</h2>
    <div class="d-grid d-md-flex justify-content-md-end">
        <a href="main.php" class="btn btn-primary">뒤로가기</a>
    </div>
    </tbody>
    </table>
    <form method="POST" action="search.php"> 
    <div class="w-50 ml-auto mr-auto mt-5">
        <!-- 책 검색 버튼 -->
        <div class="mb-3 ">
            <label for="title" class="form-label">책 제목</label>
            <input name="title" type="text" class="form-control" id="title" placeholder="title">
        </div>
        <!-- first operator 버튼 -->
        <div class="mb-3 ">
            <label for="first_op" class="form-label">first operator</label>
            <input name="first_op" type="first_op" class="form-control" id="first_op" placeholder="and / or / not">
        </div>
        <!-- 작가 검색 버튼 -->
        <div class="mb-3 ">
            <label for="author" class="form-label">작가</label>
            <input name="author" type="author" class="form-control" id="author" placeholder="author">
        </div>
        <!-- second operator 버튼 -->
        <div class="mb-3 ">
            <label for="second_op" class="form-label">second operator</label>
            <input name="second_op" type="second_op" class="form-control" id="second_op" placeholder="and / or / not">
        </div>
        <!-- publisher 검색 버튼 -->
        <div class="mb-3 ">
            <label for="publisher" class="form-label">출판사</label>
            <input name="publisher" type="publisher" class="form-control" id="publisher" placeholder="publisher">
        </div>
        <!-- third operator 버튼 -->
        <div class="mb-3 ">
            <label for="third_op" class="form-label">third operator</label>
            <input name="third_op" type="third_op" class="form-control" id="third_op" placeholder="and / or / not">
        </div>
        <!-- 출판 일자 검색 버튼 -->
        <div class="mb-3 ">
            <label for="year" class="form-label">연도</label>
            <input name="year" type="year" class="form-control" id="year" placeholder="year">
        </div>
        <button type="submit" class="btn btn-primary mb-3">검색</button>
    </div>
    </form>
    
</div>

</body>

</html>