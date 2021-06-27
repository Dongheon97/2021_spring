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

$input_title = $_POST['title'];
$title_operator = $_POST['title_operator'];
$title_not = $_POST['title_not'];

$input_author = $_POST['author'];
$author_operatior = $_POST['author_operator'];
$author_not = $_POST['author_not'];

$input_publisher = $_POST['publisher'];
$publisher_operator = $_POST['publisher_operator'];
$publisher_not = $_POST['publisher_not'];

$input_year = $_POST['year'];
$year_operator = $_POST['year_operator'];
$year_not = $_POST['year_not'];

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
    <div class="d-grid d-md-flex justify-content-md-end">
        <a href="search.php" class="btn btn-primary">뒤로가기</a>
    </div>
</div>
</body>
    <table class="table table-bordered text-center">
        <thread>
            <tr>
                <th>ISBN</th>
                <th>제목</th>
                <th>작가</th>
                <th>출판사</th>
                <th>출판연도</th>
                <th>대출여부</th>                
            </tr>
        </thread>
        <tbody>
<?php

$where = "WHERE ";

// AND
if (isset($input_title) && $input_title != ''){
    $isNot = $title_not == 'not' ? 'NOT' : '';
    $where = $where."E.TITLE ".$isNot." LIKE '%".$input_title."%'";
}
if ($title_operator == 'and' ){
    $where = $where." AND ";

}
else if($title_operator == 'or'){
    $where = $where." OR ";
}
// else if (isset($input_title) && $input_title != '' && $title_operator == 'or'){
//     $isNot = $title_not == 'not' ? 'NOT' : '';
//     $where = $where."E.TITLE ".$isNot." LIKE '%".$input_title."%'";
// }


if (isset($input_author) && $input_author != ''){
    $isNot = $author_not == 'not' ? 'NOT' : '';
    $where = $where." A.AUTHOR ".$isNot." LIKE '%".$input_author."%'";
}
// if (isset($input_author) && $input_author != '' && $author_not == 'or'){
//     $isNot = $author_not == 'not' ? 'NOT' : '';
//     $where = $where." A.AUTHOR ".$isNot." LIKE '%".$input_author."%'";
// }
if ($author_operatior == 'and' ){
    $where = $where." AND ";
}
else if($author_operatior == 'or'){
    $where = $where." OR ";
}

if (isset($input_publisher) && $input_publisher != ''){
    $isNot = $publisher_not == 'not' ? 'NOT' : '';
    $where = $where." E.PUBLISHER ".$isNot." LIKE '%".$input_publisher."%'";
}
// if (isset($input_publisher) && $input_publisher != '' && $publisher_operator == 'or'){
//     $isNot = $publisher_not == 'not' ? 'NOT' : '';
//     $where = $where." OR E.PUBLISHER ".$isNot." LIKE '%".$input_publisher."%'";
// }
if ($publisher_operator == 'and' ){
    $where = $where." AND ";
}
else if($publisher_operator == 'or'){
    $where = $where." OR ";
}

if (isset($input_year) && $input_year != ''){
    $isNot = $year_not == 'not' ? 'NOT' : '';
    $where = $where." TO_CHAR(E.YEAR, 'YYYY') ".$isNot." LIKE '%".$input_year."%'";
}
// if (isset($input_year) && $input_year != '' && $year_operator == 'or'){
//     $isNot = $year_not == 'not' ? 'NOT' : '';
//     $where = $where." OR TO_CHAR(E.YEAR, 'YYYY') ".$isNot." LIKE '%".$input_year."%'";
// }

//$where = $where.")";
//echo $where;

$stmt = $conn -> 
    prepare("SELECT E.ISBN AS ISBN, E.TITLE AS TITLE, A.AUTHOR AS AUTHOR, E.PUBLISHER AS PUBLISHER, TO_CHAR(E.YEAR, 'YYYY') AS YEAR 
    FROM EBOOK E join AUTHORS A ON A.ISBN = E.ISBN "
    .$where);


echo "SELECT E.ISBN AS ISBN, E.TITLE AS TITLE, A.AUTHOR AS AUTHOR, E.PUBLISHER AS PUBLISHER, TO_CHAR(E.YEAR, 'YYYY') AS YEAR FROM EBOOK E, AUTHORS A ".$where;

$stmt -> execute();

while ($row = $stmt -> fetch(PDO::FETCH_ASSOC)) {
?>

        <tr>
            <td><a href="bookview.php?ISBN=<?= $row['ISBN'] ?>"><?= $row['ISBN'] ?></a></td>
            <td><?= $row['TITLE'] ?></a></td>
            <td><?= $row['AUTHOR'] ?></td>
            <td><?= $row['PUBLISHER'] ?></td>
            <td><?= $row['YEAR'] ?></td>
            <!-- <?= $row['ISBORROWING'] ?></td>-->
        </tr>
<?php
}
?>
<!-- searched book list -->
