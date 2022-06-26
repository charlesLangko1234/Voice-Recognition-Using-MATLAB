## Smart Home Voice Command Recognition based on Correlation Method using Matlab

Voice Recognition merupakan salah satu bagian dari smart home untuk melakukan fungsi perintah. Hal ini dilakukan dengan menggunakan pengolahan sinyal suara. Dalam penelitian ini, dilakukan pengenalan suara dengan menggunakan metode korelasi  silang (cross-correlation), dengan membandingkan dua sinyal berupa masukan dari pengguna dan  database. Dalam penelitian ini dibuat algoritma cross-correlation dan juga GUI menggunakan MATLAB. Hasil yang diperoleh adalah cross-correlation dapat melakukan pengenalan suara, ditandai dengan amplitudo maksimum hasil korelasi diatas nilai  300

<ul>
  <li><a href="#gui">Interface Alat</a>
  <li><a href="#code">Code</a>
</ul>

### Interface Alat
<div id="gui"></div>
<img src="https://github.com/charlesLangko1234/Voice-Recognition-Using-MATLAB/blob/main/Dokumentasi/smart.png"/>
Interface alat adalh sebagai berikut, dimana Audio Input Original dan Audio Input Database adalah grafik yang akan menampilkan signal dari masing-masing audio yang digunakan. Llau terdapat juga kotak Audio Setelah Korelasi, dimana bagian ini berisi grafik audio hasil korelasi anatara dua buah sinyal, yaitu sinyal Audio Input Original dan Audio Input Database. 
Lalu, disisi kanan kotak grafik terdapat juga voice control, dimana berisi text box untuk emmasukan nama audio dan format audio. Dibagian bawahnya terdapat beberapa button seperti START dimana berfungsi untuk memulai proses korelasi dan menentukan pengenalan audio, RESET untuk menghapus semua data dan gamabaran grafik hasil perhitungan sbeelumnya, dan PLAY AUDIO yang ebrfungsi untuk memainkan audio yan sedang diiput melalui text box.
Terdapat juga disamping kanan grafik Audio Setelah Korelasi yaitu kotak untuk menampilkan poin hasil korelas dan juga hasil akhirnya. Jika Poin Kecocokan Hasil Korelasi melebihi 300, maka Hasil Ada Atau Tidaknya Audio Yang Cocok DI Databse akan menampilkan kata "Ada" atau "Tidak Ada".


### Code
<div id="code"></div>
<img src="https://github.com/charlesLangko1234/Voice-Recognition-Using-MATLAB/blob/main/Dokumentasi/flowchart.png" style="width: 200px; height:260px;"/>
Flowchart code adalah sebgaia berikut, dimana audio yang diinput serta audio yang ada didtaabase akan diekstrak dan dikorelasi satu persatu. Setelah itu akan didapatkan amplitudo tertinggi dari haris korelasi tersebut. Data audio dengan amplitudo tertinggi akan dibandingkan dengan audio yang ada pada database lalu diambil sinyal audio tersebut. Setelah itu audio akan diputar kembali jika menemukan data auido yang sama. Namun jika tidak ada audio yang sama maka akan terdapat audio yang ebrbunyi  "Access Denied" sebagai tanda bahwa tidak terdapat audio yang sama.
