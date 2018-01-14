<?php
include_once 'top.php';
include_once '../dbkoneksi.php';
$sql ="select *from kategori";
$rs = $dbh->query($sql);
?>

<table class="table" border="1" cellspacing="2" cellpadding="2">
  <thead>
      <tr>
        <th>NO</th><th>Nama</th>
      </tr>
  </thead>

<tbody>
<?php
    $counter =1;
    foreach ($rs as $row) {
      echo '<tr>';
      echo '<td>'.$counter.'</td>';
      echo '<td>'.$row['nama'].'</td>';
      echo '<tr>';
      $counter++;
    }
 ?>
    </tbody>
 </table>
<?php
include_once 'bottom.php';
?>
