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

$for_commit = $dbh -> prepare('commit');

switch ($_GET['mode']){
    case 'insert':
        // insert ebook info
        $stmt = $dbh -> prepare("INSERT INTO EBOOK (ISBN, TITLE, YEAR, PUBLISHER) VALUES ((SELECT NVL(MAX(ISBN), 0) + 1 FROM EBOOK), :title, :year, :publisher)");
        $stmt -> bindParam(':title', $title);
        $stmt -> bindParam(':year', $year);
        $stmt -> bindParam(':publisher', $publisher);
        $title = $_POST['title'];
        $year = $_POST['year'];
        $publisher = $_POST['publisher'];
        $stmt -> execute();
        // insert author info
        $stmt = $dbh -> prepare("INSERT INTO AUTHORS (ISBN, author) VALUES ((SELECT MAX(ISBN) FROM EBOOK), :author)");
        $stmt -> bindParam(':author', $author);
        $author = $_POST['author'];
        $stmt -> execute();
        // commit;
        $for_commit -> execute();
        header("Location: booklist.php");
        break;

    case 'delete':
        // delete from previous_rental
        $stmt = $dbh -> prepare('DELETE FROM PREVIOUS_RENTAL WHERE ISBN = :ISBN');
        $stmt -> bindParam(':ISBN', $ISBN);
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        // delete from author
        $stmt = $dbh -> prepare('DELETE FROM AUTHORS WHERE ISBN = :ISBN');
        $stmt -> bindParam(':ISBN', $ISBN);
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        // delete from ebook
        $stmt = $dbh -> prepare('DELETE FROM EBOOK WHERE ISBN = :ISBN');
        $stmt -> bindParam(':ISBN', $ISBN);
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        // commit;
        $for_commit -> execute();
        header("Location: booklist.php");
        break;

    case 'modify':
        // modify ebook info
        $stmt = $dbh -> prepare('UPDATE EBOOK SET TITLE = :title, YEAR = :year, PUBLISHER = :publisher WHERE ISBN = :ISBN');
        $stmt -> bindParam(':title', $title);
        $stmt -> bindParam(':year', $year);
        $stmt -> bindParam(':publisher', $publisher);
        $stmt -> bindParam(':ISBN', $ISBN);
        $title = $_POST['title'];
        $year = $_POST['year'];
        $publisher = $_POST['publisher'];
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        // modify author info
        $stmt = $dbh -> prepare('UPDATE AUTHORS SET AUTHOR = :author WHERE ISBN = :ISBN');
        $stmt -> bindParam(':author', $author);
        $stmt -> bindParam(':ISBN', $ISBN);
        $author = $_POST['author'];
        $ISBN = $_POST['ISBN'];
        $stmt -> execute();
        // commit;
        $for_commit -> execute();
        header("Location: bookview.php?ISBN=$ISBN");
        break;
}
?>