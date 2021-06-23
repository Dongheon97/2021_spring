<?php
$tns = "
    (DESCRIPTION = 
        (ADDRESS_LIST= (ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521)))
        (CONNECT_DATA= (SERVICE_NAME=XE))
    )
";
$dsn = "oci:dbname=".$tns.";charset=utf8";
$username = 'c##madang';
$password = 'madang';
$dbh = new PDO($dsn, $username, $password);

switch ($_GET['mode']){
    case 'insert':
        $stmt = $dbh -> prepare("INSERT INTO EBOOK (ISBN, TITLE, YEAR, PUBLISHER) VALUES ((SELECT NVL(MAX(ISBN), 0) + 1 FROM EBOOK), :title, :year, :publisher)");
        //$stmt2 = $dbh -> prepate("INSERT INTO AUTHORS (ISBN, author) values ( (select max(ISBN) from ebook), ':authors')")
        $stmt -> bindParam(':title', $title);
        $stmt -> bindParam(':year', $year);
        $stmt -> bindParam(':publisher', $publisher);
        //$stmt -> bindParam(':author', $author);
        $title = $_POST['title'];
        $year = $_POST['year'];
        $publisher = $_POST['publisher'];
        //$author = $_POST['author']
        $stmt -> execute();
        header("Location: booklist.php");
        break;
    case 'delete':
        $stmt = $dbh -> prepare("SELECT COUNT(ISBN) FROM previous_Rental WHERE ISBN = :ISBN");
        $stmt -> bindParam(':ISBN', $ISBN);
        $stmt -> execute();
        if($stmt > 0) {
            $stmt = $dbh -> prepare("DELETE FROM previous_Rental WHERE ISBN = :ISBN");
            $stmt -> bindParam(':ISBN', $ISBN);
            $stmt -> execute();
        }
        $stmt = $dbh -> prepare("DELETE FROM EBOOK WHERE ISBN = :ISBN");
        $stmt -> bindParam(':ISBN', $ISBN);
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        header("Location: booklist.php");
        break;
    case 'modify':
        $stmt = $dbh -> prepare('UPDATE EBOOK SET TITLE = :title , YEAR = :year, PUBLISHER = :publisher WHERE ISBN = :ISBN');
        $stmt -> bindParam(':title', $title);
        $stmt -> bindParam(':year', $year);
        $stmt -> bindParam(':publisher', $publisher);
        //$stmt -> bindParam('author', $price);
        $stmt -> bindParam(':ISBN', $ISBN);
        $title = $_POST['title'];
        $year = $_POST['year'];
        $publisher = $_POST['publisher'];
        //$price = $_POST price
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        header("Location: bookview.php?ISBN=$ISBN");
        break;
}
?>