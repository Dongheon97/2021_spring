<?php
$mysql_host = 'localhost';
$mysql_user = 'c##madang';
$mysql_password = 'madang';
$mysql_db = 'madang';
  
// 접속
$conn = pdo_mysql($mysql_host, $mysql_user, $mysql_password);
$dbconn = mysql_select_db($mysql_db, $conn);
  
// charset 설정, 설정하지 않으면 기본 mysql 설정으로 됨, 대체적으로 euc-kr를 많이 사용
mysql_query("set names utf8"); // charset UTF8
  
//쿼리, news 라는 테이블이 존재, id, title, content 필드가 존재할 경우
$query = "select * from ebook where title is not null";
  
//쿼리 성공시 쿼리 리소스 가져옴
$res = mysql_query($query, $conn);
  
while($row= mysql_fetch_array($res)){ 
  
    echo $row['컬럼명']; 
}
?>
