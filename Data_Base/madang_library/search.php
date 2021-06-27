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
    $conn = new PDO($dsn, $username, $password);
} catch (PDOException $e){
    echo ("에러 내용: ".$e -> getMessage());
}

$cno = $_SESSION['cno'];
?>

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
    <form method="POST" action="bookview_user.php"> 
    <div class="w-50 ml-auto mr-auto mt-5">
        <!-- 책 검색 버튼 -->
        <div class="mb-3 ">
            <label for="title" class="form-label">책 제목</label>
            <input name="title" type="text" class="form-control" id="title" placeholder="title">
        </div>
        <!-- title operator 버튼 -->
        <div class="mb-3 ">
            <label for="title_operator" class="form-label">제목 연산자</label>
            <input name="title_operator" type="title_operator" class="form-control" id="title_operator" placeholder="and / or ">
        </div>
        <!-- title not operator 버튼 -->
        <div class="mb-3 ">
            <label for="title_not" class="form-label">제목 not</label>
            <input name="title_not" type="title_not" class="form-control" id="title_not" placeholder="not 또는 입력 없음">
        </div>

        <!-- 작가 검색 버튼 -->
        <div class="mb-3 ">
            <label for="author" class="form-label">작가</label>
            <input name="author" type="author" class="form-control" id="author" placeholder="author">
        </div>
        <!-- author operator 버튼 -->
        <div class="mb-3 ">
            <label for="author_operator" class="form-label">작가 연산자</label>
            <input name="author_operator" type="author_operator" class="form-control" id="author_operator" placeholder="and / or">
        </div>
        <!-- author not operator 버튼 -->
        <div class="mb-3 ">
            <label for="author_not" class="form-label">작가 not</label>
            <input name="author_not" type="author_not" class="form-control" id="author_not" placeholder="not 또는 입력 없음">
        </div>

        <!-- publisher 검색 버튼 -->
        <div class="mb-3 ">
            <label for="publisher" class="form-label">출판사</label>
            <input name="publisher" type="publisher" class="form-control" id="publisher" placeholder="publisher">
        </div>
        <!-- publisher operator 버튼 -->
        <div class="mb-3 ">
            <label for="publisher_operator" class="form-label">출판사 연산자</label>
            <input name="publisher_operator" type="publisher_operator" class="form-control" id="publisher_operator" placeholder="and / or">
        </div>
      <!-- publisher not operator 버튼 -->
        <div class="mb-3 ">
            <label for="publisher_not" class="form-label">출판사 not</label>
            <input name="publisher_not" type="publisher_not" class="form-control" id="publisher_not" placeholder="not 또는 입력 없음">
        </div>

        <!-- 출판 일자 검색 버튼 -->
        <div class="mb-3 ">
            <label for="year" class="form-label">연도</label>
            <input name="year" type="year" class="form-control" id="year" placeholder="year">
        </div>
        <!-- year operator 버튼 -->
        <div class="mb-3 ">
            <label for="year_operator" class="form-label">연도 연산자</label>
            <input name="year_operator" type="year_operator" class="form-control" id="year_operator" placeholder="and / or">
        </div>
        <!-- year not operator 버튼 -->
        <div class="mb-3 ">
            <label for="year_not" class="form-label">연도 not</label>
            <input name="year_not" type="year_not" class="form-control" id="year_not" placeholder="not 또는 입력 없음">
        </div>

        <button type="submit" class="btn btn-primary mb-3">검색</button>
    </div>
    </form>
    
</div>

</body>

</html>