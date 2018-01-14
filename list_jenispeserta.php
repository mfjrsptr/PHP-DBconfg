<?php
	include_once 'top.php';

	include_once 'dbkoneksi.php';

	$sql = "SELECT * from jenis_peserta";
	$rs = $dbh->query($sql);
?>
<!--Membuat Table-->
	<table class="table">
		<thead>
			<tr>
				<th>No</th><th>Nama</th>
			</tr>
		</thead>
		<tbody>
			<?php
				$counter = 1;
				foreach ($rs as $row) {
					echo '<tr>';
					echo '<td>'.$counter.'</td>';
					echo '<td>'.$row[nama].'</td>';
					echo '</tr>';
					$counter++;
				}
			?>
		</tbody>
	</table>
<?php
	include_once 'botton.php';
?>
