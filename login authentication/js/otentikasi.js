//@author muhammad fajar saputra 01110216020
//yang ngambil source code tanpa ngasih sumbernya semoga
//cepat dapat hidayah, amin...

function Login(){

var username=document.login.username.value;
username=username.toLowerCase();
var password=document.login.password.value;
password=password.toLowerCase();

    if (username=="ahmad2017" && password=="integrity"){
      window.location="sukses.html";
      alert("Anda berhasil login");
    }else if (username !== "ahmad2017") {
      alert("Username anda salah!");
    }else if (password !== "integrity") {
      alert("Password anda salah!");
    }else{
    alert("User name dan password anda salah!");
    }
}
