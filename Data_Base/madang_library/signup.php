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
    <title>SIGN_UP</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>
   
</head>

<body>
<div class="container">
    <h2 class="text-center">회원가입</h2>
    </tbody>
    </table>
        <form action="signup_process.php" method="POST" id="signup-form">
        <div class="w-50 ml-auto mr-auto mt-5">
            <!-- CNO -->
            <div class="mb-3 ">
                <label for="cno" class="form-label">CNO</label>
                <input type="cno" name="cno" class="form-control" maxlength="5" id="cno" placeholder="5자리 숫자를 입력하시오.">
            </div>
            <!-- 이름 -->
            <div class="mb-3 ">
                <label for="name" class="form-label">이름</label>
                <input type="name" name="name" class="form-control" id="name" placeholder="이름을 입력하시오.">
            </div>
            <!-- password -->
            <div class="mb-3 ">
                <label for="password" class="form-label">비밀번호</label>
                <input name="password" type="password" class="form-control" id="password" placeholder="새로운 비밀번호를 작성하시오.">
            </div>
            <div class="mb-3 ">
                <label for="passwordCheck" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control" id="password-check" placeholder="위의 비밀번호를 똑같이 입력하시오.">
            </div>
            <!-- email -->
            <div class="mb-3 ">
                <label for="email" class="form-label">이메일</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="이메일 주소를 입력하시오.">
            </div>
        </div>
        
         <!--
                <form action="process.php?mode=delete" method="POST" class="row">
                    <input type="hidden" name="ISBN" value="<?= $ISBN ?>">
                    <button type="submit" class="btn btn-danger">삭제</button>
                </form>
            -->
            <button type="button" id="signup-button" class="btn btn-primary mb-3">SIGN-UP</button>
        </form>
    <script>
        const signupForm = document.querySelector("#signup-form");
        const signupButton = document.querySelector("#signup-button");
        const password = document.querySelector("#password");
        const passwordCheck = document.querySelector("#password-check");
        signupButton.addEventListener("click", function(e) {
            if(password.value&& password.value === passwordCheck.value){
                signupForm.submit();
            }
            else{
                alert("비밀번호가 서로 일치하지 않습니다");
            }
        });
    </script>
</div>
</body>

</html>