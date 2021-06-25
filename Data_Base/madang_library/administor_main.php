<?php 
    session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        a {
            text-decoration: none;  
        }
    </style>
    <title>ADMINISTOR_MAIN</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>
</head>

<body>
<div class="container">
    <h2 class="text-center">관리자용 메인 메뉴</h2>
    </tbody>
    </table>
    <form method="POST" action="statistic.php"> 
    <div class="w-50 ml-auto mr-auto mt-5">
        <button type="submit" class="btn btn-primary mb-3">질의 통계</button>
    </div>
    </form>
    <form method="POST" action="booklist.php"> 
    <div class="w-50 ml-auto mr-auto mt-5">
        <button type="submit" class="btn btn-primary mb-3">책 리스트</button>
    </div>
</div>
</body>
<div class="d-grid d-md-flex justify-content-md-end">
        <a href="logout_process.php" class="btn btn-primary">로그아웃</a>
</div>
</html>
