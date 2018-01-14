//@author muhammad fajar saputra 01110216020
//yang ngambil source code tanpa ngasih sumbernya semoga
//cepat dapat hidayah, amin...
function hitung()
{
x = document.form1.x.value;
pil = document.form1.opt.value;

if (pil == "dollar")
{hasil = x * 9915;}
else if (pil == "dollar sg")
{hasil = x * 13472;}
else if (pil == "ringgit")
{hasil = x * 874;}
else if (pil == "yen")
{hasil = x * 120;}
else if (pil == "euro")
{hasil = x * 15888;}
else if (pil == "riyal")
{hasil = x * 3592;}
document.form1.hasil.value = hasil;}
