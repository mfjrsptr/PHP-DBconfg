<?php
include_once 'top.php';
include_once 'dbkoneksi.php';
$sql ="select *from vw_peserta";
$rs = $dbh->query($sql);
?>

<table class="table" >
  <thead>
      <tr>
        <th>NO</th><th>Nama</th><th>Nama peserta</th>
        <th>Email</th><th>kegiatan</th><th>Tanggal Daftar</th><th>Action</th>
      </tr>
  </thead>

<tbody>
<?php
    $counter =1;
    foreach ($rs as $row) {
      echo '<tr>';
      echo '<td>'.$counter.'</td>';
      echo '<td>'.$row['kode'].'</td>';
      echo '<td>'.$row['peserta'].'</td>';
      echo '<td>'.$row['email'].'</td>';
      echo '<td>'.$row['kegiatan'].'</td>';
      echo '<td>'.$row['tgl_daftar'].'</td>';
      echo'<td><a href="view_peserta.php?no=FIELD_NOPESERTA'.$row['Action'].'"><i class="fa fa-eye" aria-hidden="true"></i></a> |';
      echo'<a href="form_peserta.php?on=FIELD_NOPESERTA'.$row['Actions'].'"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> | ';
      echo' <a href="delete_peserta.php?on=FIELD_NOPESERTA'.$row['Actions'].'"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';
      echo '<tr>';

      $counter++;
    }
 ?>
    </tbody>
 </table>

<?php
include_once 'bottom.php';
?>
