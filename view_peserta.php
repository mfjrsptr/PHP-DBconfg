<?php
	include_once 'top.php';

  include_once 'dbkoneksi.php';
  $_nomor=$_GET['no'];
  $sql ="select *from vw_peserta WHERE kategori=?";
  $st = $dbh->prepare($sql);
	$st->execute([$_nomor]); // execute untuk menjalankan prepared
	$row = $st->fetch();

	echo '<br> No Peserta : '.$row['kode'];
  echo '<br> Nama Lengkap : '.$row['peserta'];
	echo '<br> Email : '.$row['email'];
	echo '<br> tanggal Daftar : '.$row['tgl_daftar'];
?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            function generateBarCode()
            {
                var nric = $('#text').val();
                var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + nric + '&amp;size=50x50';
                $('#barcode').attr('src', url);
            }
        </script>
    </head>
    <body>
    <h3> SEM201701-002 </h3>

      	<img id='barcode'
            src="https://api.qrserver.com/v1/create-qr-code/?data=HelloWorld&amp;size=500x500"
            alt="" title="HELLO" width="200" height="200" />
	</body>

<?php
	include_once 'bottom.php';
?>
