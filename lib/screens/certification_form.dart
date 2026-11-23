import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class CertificationFormPage extends StatefulWidget {
  const CertificationFormPage({super.key});

  @override
  State<CertificationFormPage> createState() => _CertificationFormPageState();
}

class _CertificationFormPageState extends State<CertificationFormPage> {
  // Kunci untuk mengakses state Form (validate, reset).
  final _formKey = GlobalKey<FormState>();

  // Menyimpan isian field teks.
  String _name = "";
  String _issuer = "";
  String _credentialId = "";
  String _credentialUrl = "";

  // Menyimpan tanggal yang dipilih. Nullable karena awalnya belum dipilih.
  DateTime? _issueDate;
  DateTime? _expiryDate;
  
  // Controller untuk menampilkan teks tanggal di dalam field.
  final _issueDateController = TextEditingController();
  final _expiryDateController = TextEditingController();

  @override
  void dispose() {
    // Controller wajib dibuang saat halaman ditutup agar tidak memory leak.
    _issueDateController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  // Mengubah DateTime menjadi teks, contoh: 5 Mei 2026.
  String _formatDate(DateTime date) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  // Membuka kalender untuk tanggal terbit.
  Future<void> _pickIssueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _issueDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // tidak bisa memilih tanggal di masa depan
    );
    if (picked != null) {
      setState(() {
        _issueDate = picked;
        _issueDateController.text = _formatDate(picked);
      });
    }
  }

  // Membuka kalender untuk tanggal kedaluwarsa.
  Future<void> _pickExpiryDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate ?? _issueDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _expiryDate = picked;
        _expiryDateController.text = _formatDate(picked);
      });
    }
  }

  
  // Menampilkan "-" untuk isian opsional yang kosong.
  String _orDash(String value) => value.trim().isEmpty ? "-" : value.trim();

  // Mengosongkan seluruh form beserta variabel state-nya.
  void _resetForm() {
    setState(() {
      _name = "";
      _issuer = "";
      _credentialId = "";
      _credentialUrl = "";
      _issueDate = null;
      _expiryDate = null;
      _issueDateController.clear();
      _expiryDateController.clear();
    });
    // Dipanggil terakhir agar pesan error ikut bersih.
    _formKey.currentState!.reset();
  }

  // Dipanggil saat tombol Simpan ditekan.
  void _submitForm() {
    // Jalankan semua validator; jika ada yang gagal, berhenti di sini.
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sertifikasi berhasil disimpan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nama Sertifikasi: ${_name.trim()}'),
                Text('Penerbit: ${_issuer.trim()}'),
                Text('Tanggal Terbit: ${_formatDate(_issueDate!)}'),
                Text(
                  'Tanggal Kedaluwarsa: '
                  '${_expiryDate == null ? "Tidak ada" : _formatDate(_expiryDate!)}',
                ),
                Text('Credential ID: ${_orDash(_credentialId)}'),
                Text('URL Kredensial: ${_orDash(_credentialUrl)}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // tutup dialog
                _resetForm(); // kosongkan form
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Certification Form',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Warna diambil dari tema (sama dengan AppBar di halaman utama).
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Warna teks judul dan ikon hamburger drawer.
        foregroundColor: Colors.white,
      ),
      // Drawer yang sama dengan halaman utama dan form proyek.
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Associate Android Developer",
                    labelText: "Nama Sertifikasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Tombol "Next" di keyboard pindah ke field berikutnya.
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama sertifikasi tidak boleh kosong!";
                    }
                    if (value.trim().length > 100) {
                      return "Nama sertifikasi maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // === Penerbit ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Google, Dicoding, Coursera",
                    labelText: "Penerbit",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    setState(() {
                      _issuer = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Penerbit tidak boleh kosong!";
                    }
                    if (value.trim().length > 100) {
                      return "Penerbit maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),
                            // === Tanggal Terbit ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _issueDateController,
                  readOnly: true, // tidak bisa diketik, hanya lewat kalender
                  onTap: _pickIssueDate,
                  // Validasi ulang otomatis setelah tanggal dipilih.
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal terbit",
                    labelText: "Tanggal Terbit",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (_) {
                    if (_issueDate == null) {
                      return "Tanggal terbit wajib dipilih!";
                    }
                    if (_issueDate!.isAfter(DateTime.now())) {
                      return "Tanggal terbit tidak boleh di masa depan!";
                    }
                    return null;
                  },
                ),
              ),
              // === Tanggal Kedaluwarsa ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _expiryDateController,
                  readOnly: true,
                  onTap: _pickExpiryDate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal kedaluwarsa (opsional)",
                    labelText: "Tanggal Kedaluwarsa",
                    // Kalau sudah dipilih, tampilkan tombol X untuk menghapus.
                    suffixIcon: _expiryDate == null
                        ? const Icon(Icons.event_busy)
                        : IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                _expiryDate = null;
                                _expiryDateController.clear();
                              });
                            },
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (_) {
                    // Opsional: boleh kosong (sertifikat berlaku selamanya).
                    if (_expiryDate == null || _issueDate == null) {
                      return null;
                    }
                    if (!_expiryDate!.isAfter(_issueDate!)) {
                      return "Tanggal kedaluwarsa harus setelah tanggal terbit!";
                    }
                    return null;
                  },
                ),
              ),
              // === Credential ID ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "ID kredensial (opsional)",
                    labelText: "Credential ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (String? value) {
                    setState(() {
                      _credentialId = value!;
                    });
                  },
                  validator: (String? value) {
                    // Opsional: kosong boleh, tapi kalau diisi dibatasi panjangnya.
                    if (value != null && value.trim().length > 50) {
                      return "Credential ID maksimal 50 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // === URL Kredensial ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "https://... (opsional)",
                    labelText: "URL Kredensial",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Keyboard khusus URL (ada tombol "/" dan ".com").
                  keyboardType: TextInputType.url,
                  autocorrect: false,
                  // Field teks terakhir: tombol keyboard jadi "Done".
                  textInputAction: TextInputAction.done,
                  onChanged: (String? value) {
                    setState(() {
                      _credentialUrl = value!;
                    });
                  },
                  validator: (String? value) {
                    // Opsional: kosong boleh.
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }
                    final url = value.trim();
                    if (url.contains(' ')) {
                      return "URL tidak boleh mengandung spasi!";
                    }
                    final uri = Uri.tryParse(url);
                    if (uri == null ||
                        !(uri.scheme == 'http' || uri.scheme == 'https') ||
                        !uri.host.contains('.')) {
                      return "URL tidak valid! Contoh: https://example.com";
                    }
                    return null;
                  },
                ),
              ),
              // === Tombol Simpan ===
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _submitForm,
                    icon: const Icon(Icons.save),
                    label: const Text("Simpan"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}