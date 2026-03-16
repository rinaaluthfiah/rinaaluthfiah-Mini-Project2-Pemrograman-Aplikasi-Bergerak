
# Healthtracker

<img width="450" height="170" alt="Screenshot 2026-02-28 023202" src="https://github.com/user-attachments/assets/b7a5e96d-1354-4654-b8e9-68f17f822c39" />

# 👩‍💻Author

| Isrina Luthfiah |
|---------------|
| ![WhatsApp Image 2025-05-08 at 11 42 13 (1)](https://github.com/user-attachments/assets/b58f52b9-7692-4c50-811a-0fefba46169f)| 
| 2409116003 |
Sistem Informasi A '24 |


#  📜 Deskripsi Aplikasi Healthtracker

HealthTracker merupakan aplikasi mobile yang dirancang untuk membantu pengguna dalam mencatat, mengelola, dan memantau riwayat konsumsi obat secara terstruktur. Aplikasi ini menyediakan fitur  untuk menambahkan, menampilkan, mengubah, dan menghapus
dataobat yang telah atau akan dikonsumsi. HealthTracker juga dilengkapi dengan sistem pengelompokan berdasarkan kategori obat, 
seperti Obat Bebas, Obat Bebas Terbatas, Obat Keras, dan Obat Herbal. Dengan adanya fitur kategori ini, pengguna dapat lebih mudah mengelompokkan data obat dengan lebih rapi dan mudah diakses. Selain itu, aplikasi ini menyediakan fitur pengingat konsumsi obat serta menampilkan riwayat konsumsi terbaru guna membantu pengguna dalam menjaga konsistensi dan kepatuhan terhadap jadwal pengobatan.

# 🌟 Fitur Aplikasi HealthTracker

HealthTracker dirancang dengan berbagai fitur yang mendukung pengelolaan riwayat konsumsi obat secara terstruktur.
Fitur utama dalam aplikasi ini mengacu pada konsep CRUD (Create, Read, Update, Delete) yang menjadi dasar dalam pengelolaan data.

## 1️⃣  Registrasi ##

<p align="center">
  <img src="https://github.com/user-attachments/assets/fe818b02-8ee3-4462-a3ac-ae195745ee04" width="46%">
  <img src="https://github.com/user-attachments/assets/1190c96f-7ca8-413b-bfd4-9f9fa15bf530" width="44%">
</p>

Halaman Register digunakan untuk membuat akun baru pada aplikasi HealthTracker. Pada halaman ini, pengguna diminta untuk memasukkan email dan password melalui form yang tersedia. Data yang dimasukkan kemudian diproses menggunakan Supabase Authentication sehingga akun dapat tersimpan dengan aman di sistem. Setelah proses registrasi berhasil, pengguna dapat melakukan login untuk mengakses seluruh fitur yang tersedia dalam aplikasi.


## 2️⃣  Login  ##

 <img src="https://github.com/user-attachments/assets/c305e2c0-d112-4196-8ae1-a93c6edc0a6c" width="48%">

<img src="https://github.com/user-attachments/assets/8f99832f-7248-4816-9156-3a5c537fbea2" width="46%">


Halaman Login digunakan oleh pengguna untuk masuk ke dalam aplikasi HealthTracker dengan memasukkan email dan password yang telah terdaftar. Data yang dimasukkan akan diverifikasi melalui Supabase Authentication. Jika email atau kata sandi yang dimasukkan salah, maka akan muncul pesan “Invalid login credentials” sebagai pemberitahuan bahwa data login tidak valid. 


<img src="https://github.com/user-attachments/assets/5e3a6ce9-26a7-49d9-b7ad-a9cf1336a197" width="49%">


Jika proses login berhasil, akan muncul notifikasi “Login Berhasil” di halaman utama dan pengguna bisa langsung mengakses fitur aplikasi.

##  3️⃣ Light Mode dan Dark Mode  ##

 <img src="https://github.com/user-attachments/assets/f6733828-d4a7-4c50-bf16-a37b85fd600c" width="45%">

<img src="https://github.com/user-attachments/assets/1238399f-4beb-413b-94df-d1057a9af416" width="44%">

Aplikasi HealthTracker juga menyediakan fitur Light Mode dan Dark Mode yang memungkinkan pengguna mengganti tampilan tema aplikasi sesuai yang diinginkan. Pengguna dapat beralih antara mode terang dan mode gelap melalui tombol yang tersedia pada halaman utama di pojok sebelah kanan.  Jika menekan tombol 🌙  makan tampilannya akan menjadi gelap, tetapi jika memilih  ☀️ tampilannya akan terang. Fitur ini bertujuan untuk meningkatkan kenyamanan pengguna saat menggunakan aplikasi.

## 4️⃣ Fitur Tambah Data (Create) ##


<img src="https://github.com/user-attachments/assets/3ae55fb6-a7cc-4d50-bcad-8dca3e74b31a" width="47%">

<img src="https://github.com/user-attachments/assets/60d4e128-8b09-4a17-a4e0-a1590ebb24e8" width="47%">


Aplikasi HealthTracker menyediakan halaman  untuk menambahkan data obat baru. Pada halaman ini, pengguna dapat mengisi beberapa informasi penting seperti nama obat, dosis, frekuensi konsumsi, tanggal konsumsi, serta jam konsumsi. Data yang telah diinput akan disimpan ke dalam daftar riwayat sesuai dengan kategori obat yang dipilih. Fitur ini memastikan setiap konsumsi obat dapat tercatat dengan baik.


## 5️⃣ Fitur Tampilkan Data (Read) ##

<img src="https://github.com/user-attachments/assets/20778c38-b34f-4519-a20f-060210668c18" width="47%">


<img src="https://github.com/user-attachments/assets/047207fa-9aa6-4d6b-93ac-1a029bb0835c" width="47%">


Semua data obat yang telah dimasukkan akan ditampilkan secara tersusun berdasarkan kategori. Setiap item menampilkan informasi lengkap seperti nama obat, dosis, frekuensi, tanggal, jam konsumsi


## 6️⃣ Fitur Edit Data (Update) ##

<img src="https://github.com/user-attachments/assets/c9a908df-a95f-481c-ace0-e2675b476285" width="47%">

<img src="https://github.com/user-attachments/assets/74f09457-c0dc-49f3-ab48-b1f6a12bb153" width="48%">

HealthTracker menyediakan fitur agar penguna dapat dengan mudah mengubah data obat yang sudah ada, jika terjadi kesalahan dalam menginput atau hal yang lain. Dengan menekan tombol edit pada obat yang ingin diperbarui, maka pengguna akan diarahkan ke halaman yang sudah terisi dengan data sebelumnya. Setelah melakukan perubahan, pengguna dapat menyimpan kembali data tersebut dengan menekan tombol update, maka otomatis data obat akan  berubah  akurat dan terperbarui.


## 7️⃣ Fitur Hapus Data (Delete) ##
Sebelum Dihapus 

<img src="https://github.com/user-attachments/assets/d267d82c-1af0-4cd2-be25-afb06c6175a7" width="49%">


Setelah Dihapus 

<img src="https://github.com/user-attachments/assets/94cc6f3f-2c15-4932-b00e-4d9ec16d9afa" width="49%">


Setiap data obat dapat dihapus melalui tombol berikon tempat sampah berwarna merah yang tersedia. Fitur ini memudahkan pengguna untuk menghapus data obat yang sudah tidak diperlukan atau obat yang sudah dikonsumsi, sehingga daftar riwayat tetap rapi, relevan, dan tidak menumpuk dengan informasi yang tidak lagi digunakan. 

## 8️⃣ Fitur Pengingat Konsumsi Obat (tambahan) ##


<img src="https://github.com/user-attachments/assets/490e6e2c-02c2-439a-81d5-fdb0760d220a" width="47%">

Aplikasi menampilkan pengingat obat yang belum diminum pada halaman utama. Fitur ini membantu pengguna untuk lebih disiplin dalam mengikuti jadwal konsumsi obat dan meminimalkan risiko lupa minum obat.

##  9️⃣ Fitur Status Konsumsi Obat (tambahan) ##

<img width="400" height="300" alt="Image" src="https://github.com/user-attachments/assets/a2d08394-39f1-4045-bc25-df0f9e3bf215" />

<img width="400" height="300" alt="Image" src="https://github.com/user-attachments/assets/81385d74-087f-424d-824f-6c0af7a05687" />
/>

Pengguna bisa menandai apakah obat sudah diminum atau belum lewat tombol di setiap item. Statusnya ditunjukkan dengan warna atau ikon yang berbeda, sehingga lebih gampang bagi pengguna untuk melihat obat mana yang sudah dikonsumsi.

## 🔟 Fitur Kategori Obat (tambahan) ##

<img src="https://github.com/user-attachments/assets/3bca10c9-003b-4948-8801-f00cd77792fb" width="47%">


HealthTracker mengelompokkan obat berdasarkan kategori seperti Obat Bebas, Obat Bebas Terbatas, Obat Keras, dan Obat Herbal, agar pengguna bisa lebih mudah mengatur dan menemukan obat sesuai jenisnya.


# 📲 Widget Yang Digunakan

## 1️. MaterialApp ##

<img width="450" height="568" alt="image" src="https://github.com/user-attachments/assets/d85e80fc-f6df-4061-9a33-d412ff4032a4" />

Widget utama untuk memulai aplikasi Flutter.

## 2. Scaffold ##

<img width="450" height="266" alt="image" src="https://github.com/user-attachments/assets/aecd5f1f-7526-49c0-a871-65dc5635ca60" />

Scaffold menyediakan kerangka halaman termasuk AppBar, body, dan tombol aksi. 

## 3. AppBar ##

<img width="450" height="97" alt="image" src="https://github.com/user-attachments/assets/60135b44-d3ed-4c5a-952c-d4908f9fe739" />

AppBar  bagian atas aplikasi yang menampilkan judul halaman dan warna background. Pada HomePage, AppBar menampilkan nama kategori obat yang dipilih (misalnya: Obat Bebas, Obat Keras).


## 4. ListView.builder ##

<img width="450" height="300" alt="image" src="https://github.com/user-attachments/assets/7683e60e-ad26-4edd-8ea7-9ddc51ce5d35" />


Menampilkan daftar data dalam bentuk scroll, dipakai untuk:
- Menampilkan riwayat obat
- Menampilkan list kategori

## 5. GridView ##

<img width="450" height="400" alt="image" src="https://github.com/user-attachments/assets/3a384481-5efb-47db-b6d8-59d634b0af5c" />


Menampilkan kategori obat dalam bentuk  kotak-kotak (grid) membagi menjadi dua kolom agar lebih rapi dan mudah dipilih, seperti (Obat keras, Obat herbal,dll)

## 6. Column & Row ##

<img width="450" height="424" alt="image" src="https://github.com/user-attachments/assets/ea6e04c1-df12-4477-9d92-442c2f40f875" />

Row menyusun widget horizontal(ke samping), Sedangkan Column menyusun widget secara vertikal(ke bawah)

## 7. Expanded ##

<img width="450" height="144" alt="image" src="https://github.com/user-attachments/assets/5eb8a2ba-64e8-4bad-b859-1d9c54cc7e48" />

Expanded digunakan untuk membuat widget mengisi sisa ruang yang tersedia di dalam Row atau Column.


## 8. Container ##

<img width="450" height="139" alt="image" src="https://github.com/user-attachments/assets/fa07fdea-2be1-4287-a4a0-9a26f43989cd" />


Container di aplikasi ini  digunakan untuk memberi warna, memberi padding, mengatur ukuran dan yang lainnya,dalam aplikasi ini digunakan untuk membuat card obat dan box kategori menjadi aesthetic.


## 9. TextFormField ##

<img width="450" height="142" alt="image" src="https://github.com/user-attachments/assets/a37a53ee-45ce-4b75-b4fb-623e76261a04" />


TextFormField adalah widget untuk input data dari pengguna.
Digunakan untuk menginput seperti Nama obat, Dosis, Frekuensi Jam, dll

## 10. ElevatedButton ##


<img width="450" height="199" alt="image" src="https://github.com/user-attachments/assets/5125400b-e0cd-47d7-818c-fa6ced03344a" />

ElevatedButton adalah tombol utama yang biasanya digunakan untuk aksi seperti menyimpan data

## 11. FloatingActionButton ##

<img width="450" height="282" alt="image" src="https://github.com/user-attachments/assets/35a8d733-4408-4dc5-8f34-2a5a469b3736" />

FloatingActionButton adalah tombol  yang biasanya berada di pojok kanan bawah.
Digunakan untuk membuka halaman tambah data obat.

## 12. IconButton ##

<img width="450" height="145" alt="image" src="https://github.com/user-attachments/assets/519a1e08-bfe8-443d-b33e-5fb7cda266e2" />


 Digunakan untuk ikon yang bisa ditekan seperti menghapus, mengedit dan yang lainnya

## 13. ChangeNotifierProvider ##

<img width="450" height="122" alt="image" src="https://github.com/user-attachments/assets/88956cd3-246e-4216-a5c0-564a5505a18f" />


Bagian dari package Provider untuk mengatur dan membagikan data ke semua halaman.

## 14. Box Decoration ##

<img width="450" height="262" alt="image" src="https://github.com/user-attachments/assets/efa7be36-ca33-4b39-8f0e-08de2315b0cf" />


BoxDecoration digunakan di dalam Container untuk mengatur tampilan seperti Warna, Border radius, Shadow dan Gradient

## 15. Navigator  ##

<img width="450" height="114" alt="image" src="https://github.com/user-attachments/assets/37e0875d-e451-4f86-a261-3a8affe90ddd" />

Digunakan untuk berpindah halaman 


## 16. LinearGradient ##

<img width="450" height="146" alt="image" src="https://github.com/user-attachments/assets/fd6122a6-e135-4107-8ab1-45792e6bdd60" />

Digunakan untuk memberi efek warna gradasi.


## 17. DropdownButtonFormField ##








