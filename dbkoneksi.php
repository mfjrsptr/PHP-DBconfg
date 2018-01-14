<?php
    $host = 'localhost';
    $db = 'dbkegiatan';
    $user = 'siswa';
    $pass = '12345';
    $dsn = "mysql:host=$host;dbname=$db";
    $opt =[
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ];

    try {
          $dbh = new PDO($dsn, $user, $pass, $opt);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

 ?>
