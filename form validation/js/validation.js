//@author muhammad fajar saputra 01110216020
//yang ngambil source code tanpa ngasih sumbernya semoga
//cepat dapat hidayah, amin...

function formvalidasi() {
    var nama = document.getElementById('nama').value;
    var email = document.getElementById('email').value;
    var jam = document.getElementById('jam').value;
    var tujuan = document.getElementById('tujuan').value;
    var tiket = document.getElementById('tiket').value;

    if (nama == "" ) {
      alert('kolom nama harus terisi');
      return false;
    }else if (email == "") {
      alert('kolom email harus terisi');
      return false;
    }else if (jam =="") {
      alert('jam anda tidak valid');
      return false;
    }else if (tujuan == "") {
      alert("tujuan yang anda inputkan tidak tepat");
      return false;
    }else if (tiket == "") {
      alert("jumlah tiket yang anda inputkan tidak tepat");
      return false;
    }else{
    console.log("Form Valid");
      document.getElementById('tampil_title').innerHTML = "Data anda adalah :";
      document.getElementById('tampil_nama').innerHTML = ("Nama Pelanggan : " + nama);
      document.getElementById('tampil_email').innerHTML = ("E-mail : " + email);
      document.getElementById('tampil_jam').innerHTML = ("Jam : " + jam);
      document.getElementById('tampil_tujuan').innerHTML = ("Tujuan keberangkatan: " + tujuan);
      document.getElementById('tampil_tiket').innerHTML = ("Jumlah Tiket : " + tiket);
    }
}
