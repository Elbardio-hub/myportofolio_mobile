# myportofolio_mobile

MyPortfolio Mobile adalah aplikasi portofolio pribadi berbasis Flutter. Aplikasi ini menampilkan identitas pemilik serta tiga tombol menu, yaitu Lihat Proyek, Tambah Proyek, dan Logout. Setiap tombol memiliki warna berbeda dan menampilkan SnackBar saat ditekan.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Tugas Individu 7
1. Widget tree adalah strutur pohon yang menggmabarkan bagaimana seluruh widget disusun untuk membuat suatu aplikasi flutter. Setiap widget dapat memiliki anak (child), widget yang berada di dalam widget tersebut (nested) dan induk(parent), widget yang membungkus widget tsb. Contohnya, widget Row dapat memiliki beberapa Column, dan setiap Column dapat berisi Icon dan Text. Jika state suatu widget berubah, widget tersebut dan anak-anak yang terlibat dapat dibangun ulang.

2. Widget yang digunakan dalam aplikasi ini ada beberapa dimulai dari MyApp sebagai widget utama dan MaterialApp untuk mengatur tema serta halaman awal aplikasi. MyHomePage menyusun halaman utama (home), sedangkan Scaffold menyediakan strutur atau kerangka halaman dan AppBar menampilkan judul aplikasi.

Row menyusun widget secara horizontal, sedangkan Column menyusunnya secara vertikal. Padding memberi ruang di sekitar widget, SizedBox memberi jarak antar widget, Center menempatkan widget ditengah, dan Container mengatur ukuran serta ruang di dalamnya.

InfoCard menampilkan identitas menggunakan card, sedangkan Gridview.count menyusun tombol dalam bentuk grid. ItemCard menampilkan tombol dengan Material sebagai tampilannya dan InkWell untuk menangani ketukan. Text menapilkan tulisan, Icon menampilkan ikon, dan SnackBar menampilkan pesan ketika tombol ditekan.

3. MaterialApp adalah widget yang digunakan untuk mengatur konfigurasi utama aplikasi Flutter, seperti tema warna, judul aplikasi, dan halaman utama. Widget ini biasanya digunakan sebagai root widget karena menjadi dasar bagi widget lain dalam aplikasi dan menyediakan pengaturan tampilan yang dapat digunakan oleh widget di bawahnya.

4. StatelessWidget adalah widget yang tidak memiliki state internal yang berubah secara dinamis, sehingga cocok digunakan untuk tampilan yang tetap, seperti informasi profil. Sementara itu, StatefulWidget adalah widget yang memiliki state yang dapat berubah, sehingga cocok digunakan untuk tampilan yang perlu diperbarui akibat interaksi pengguna, seperti penghitung angka.

5. BuildContext adalah objek yang menunjukkan posisi suatu widget dalam widget tree. BuildContext penting karena memungkinkan widget mengakses informasi dari widget lain yang berada di atasnya. Dalam metode build(BuildContext context), objek context dapat digunakan untuk mengambil tema dengan Theme.of(context), mendapatkan ukuran layar dengan MediaQuery.of(context), atau menampilkan SnackBar dengan ScaffoldMessenger.of(context).

6. Hot reload adalah fitur Flutter yang memungkinkan perubahan kode langsung terlihat tanpa menghilangkan state aplikasi. Sementara itu, hot restart menjalankan ulang aplikasi dan menghapus state sebelumnya. Hot restart diperlukan jika perubahan terjadi pada bagian seperti main() atau initState() yang tidak dijalankan ulang oleh hot reload. Adapun full restart diperlukan jika terdapat perubahan pada kode native, seperti Java, Kotlin, Objective-C, atau Swift, karena aplikasi perlu dikompilasi dan dijalankan ulang.

### AI Disclosure
Menggunakan ChatGPT dalam memahami konsep-konsep dan meberikan contoh konkret yang sulit dipahamai hanya dengan membaca penjelasan di tutorial atau di google.

### Tugas Individu 8
1. 
- Navigator.push() menaruh halaman baru di atas tumpukan. halaman lama tetap ada di bawahnya sehingga pegguna bisa kembali ke halaman lama dengan menekan tombol back.
- Navigator.pushReplacement() mengganti halaman paling atas dengan halaman baru. Halaman lama dihapus. jadi tombol back tidak aakan kembali ke halaman lama.
- Navigator.pop() Mendelete halaman paling atas, sehingga pengguna kembali ke halaman dibawahnya.

Kartu aksi Tambah Sertifikasi membuka formulir dengan Navigator.push() di 'project_card.dart', sehingga pengguna bisa kembali ke halaman utama dengan tombol back perangkat atau browser. Opsi home di drawer memakai Navigator.pushReplacement() dengan MaterialpageRoute(builder: (context) => MyHomePage()). Halaman formulir yg sedang terbuka diiganti dengan halaman utama, tanpa menumpuk halaman formulir di bawahnya.

2. Scaffold adalah kerangka halaman: appBar di atas, drawer di samping, dan body di tengah. Karena halama utama, formulir project, dan formulir sertifikasi sama-sama menggunakan Scaffold, susunan semua halaman jadi seragam: judul selalu di appBar, dan menu navigasi selalu di ikon ☰. Drawer nya juga satu widget yg sama (LeftDrawer), jd jika saya menambhakan opsi baru, opsi itu akan lgsgs muncul di semua halaman. contoh warna tema: di main.dart saya mengatur ColorScheme.fromSeed(seedColor: colors.indigo). Warna itu saya ambil dengan Theme.of(context).colorScheme.primary utk AppBar di halamn utama, serta Appbar dan tombol Simpan di halam sertifikasi. Jd warnanya konsisten, dan cukup diubah di satu tempat (main.dart) jika ingin mengubah tema.

3. Formulir disusun sebagai Form -> SingleChildScrollView -> Column sehingga setiap input tampil satu per baris dari atas ke bawah. Susunan satu kolom paling mudah dibaca dan diisi di layar ponsel yang sempit, dan urutannya jelas: nama, penerbit, tanggal, lalu tombol Simpan.
- Widget pengatur jarak: setiap field dibungkus padding (8 piksel), dan SingleChildScrollView juga diberi padding. Hasilnya, field tidak saling menempel, tidak mepet ke tepi layar, dan lebih mudah disentuh.
- formulir punya 6 input dan 1 tombol, yang bisa lebih tinggi dari layar, apalagi saat papan ketik muncul dan menutupi setengah layar. Tanpa SingleChildScrollView, isi yang tidak muat akan terpotong dan tombol Simpan tidak bisa dijangkau. Dengan penggulir, pengguna cukup menggeser layar untuk mencapai semua input dan tombol Simpan.

4. GlobalKey<FormState> adalah pegangan untuk mengakses Form dari luar, misalnya dari tombol Simpan. Lewat _formKey.currentState saya bisa memanggil validate() dan reset().
Validator adalah fungsi pemeriksa di setiap field. Fungsi ini mengembalikan pesan error kalau isisan salah, atau null kalau benar. validate() menjalankan semua validator sekaligus. kalau ada yg gagal, pesan error akan tampil di bawah field terakait dan validate() mengembalikan false, jadi dialog tidak muncul. Dialog ringkasan hanya muncul jika semua field lolos.
Contoh nilai yang ditolak: URL Kredensial `www.google.com` ditolak dengan pesan *"URL tidak valid! Contoh: https://example.com"* karena tidak diawali `http://` atau `https://`. Contoh lain: Nama Sertifikasi yang hanya berisi spasi ditolak karena kosong setelah di-`trim()`.
Memilih jenis input atau papan ketik saja belum cukup karena `keyboardType: TextInputType.url` hanya **mengubah tampilan papan ketik** (menambahkan tombol `/` dan `.com`), tetapi **tidak membatasi** apa yang diketik. Pengguna tetap bisa mengetik `abc`, menempelkan (*paste*) teks sembarang, atau memakai keyboard laptop saat dijalankan di Chrome. Begitu juga dengan date picker: kalender memang mencegah salah ketik tanggal, tetapi tidak tahu bahwa tanggal kedaluwarsa harus **setelah** tanggal terbit. Aturan seperti itu hanya bisa dipastikan oleh `validator`.

### AI Disclosure
Menggunakan gemini untuk memahami tutorial lebih dalam dan agar bisa mengimplementasikannya di Tugas Individu 8 dengan baik dan memeriksa pekerjaan hasil Tugas Individu 8 dan memabantu terkait dengan synatx serta jika ada yg error.