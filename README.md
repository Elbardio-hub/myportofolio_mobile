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
Menggunaka ChatGPT dalam memahami konsep-konsep dan meberikan contoh konkret yang sulit dipahamai hanya dengan membaca penjelasan di tutorial atau di google.