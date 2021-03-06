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
    <title>SIGN_IN</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>
</head>

<body>
<div class="container">
    <h2 class="text-center">회원 전용 로그인</h2>
        <!-- 회원가입 버튼 -->
        <div class="d-grid d-md-flex justify-content-md-end">
            <a href="signup.php" class="btn btn-primary">회원가입</a>
        </div>
    </tbody>
    </table>
    <form method="POST" action="login_process.php"> 
    <div class="w-50 ml-auto mr-auto mt-5">
        <!-- cno 입력 버튼 -->
        <div class="mb-3 ">
            <label for="cno" class="form-label">CNO</label>
            <input name="cno" type="text" class="form-control" id="cno" placeholder="5자리 숫자 입력">
        </div>
        <!-- 비밀번호 버튼 -->
        <div class="mb-3 ">
            <label for="password" class="form-label">비밀번호</label>
            <input name="password" type="password" class="form-control" id="password" placeholder="비밀번호 입력">
        </div>
        <button type="submit" class="btn btn-primary mb-3">SIGN-IN</button>
    </div>
     <!-- 관리자 계정 로그인 버튼 -->
     <div class="d-grid d-md-flex justify-content-md-end">
            <a href="administor.php" class="btn btn-primary">관리자로 접속</a>
        </div>
    </form>
    
</div>
</body>

</html>