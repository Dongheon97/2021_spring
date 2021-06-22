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
        $publisher = $row ['
price = row [['
    }


}
<!DOCTYPE html
html lang ko
head
meta charset ="UTF 8"
meta name viewport " content width device width , initial scale =