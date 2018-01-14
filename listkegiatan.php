<?php
	include_once 'top.php';

	include_once 'dbkoneksi.php';

	$sql = "SELECT * from kegiatan";
	$rs = $dbh->query($sql);
?>

	<!--membuat table-->

	<table class="table">
		<thead>
			<tr>
				<th>No</th>
				<th>Kode</th>
				<th>Judul</th>
				<th>Deskripsi</th>
				<th>Narasumber</th>
				<th>Kategori_id</th>
				<th>Biaya</th>
				<th>Kapasitas</th>
				<th>Tanggal Mulai</th>
				<th>Tanggal Akhir</th>
				<th>Tempat</th>
			</tr>
		</thead>
		<tbody>
			<?php
				$counter = 1;
				foreach ($rs as $row) {
					echo '<tr>';
					echo '<td>' .$counter.'</td>';
					echo '<td>'.$row[kode].'</td>';
					echo '<td>'.$row[judul].'</td>';
					echo '<td>'.$row[deskripsi].'</td>';
					echo '<td>'.$row[narasumber].'</td>';
					echo '<td>'.$row[kategori_id].'</td>';
					echo '<td>'.$row[biaya].'</td>';
					echo '<td>'.$row[kapasitas].'</td>';
					echo '<td>'.$row[tgl_mulai].'</td>';
					echo '<td>'.$row[tgl_akhir].'/td>';
					echo '<td>'.$row[tempat].'</td>';
					echo '</tr>';
					$counter++;
				}
			?>
		</tbody>
	</table>
<?php
	include_once 'bottom.php';
?>
