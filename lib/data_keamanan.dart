import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'daftar.dart'; // Import file daftar.dart
import 'kebijakan.dart'; // Import file kebijakan.dart

void main() {
  runApp(PrivacyScreenApp());
}

class PrivacyScreenApp extends StatelessWidget {
  const PrivacyScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PrivacyScreen(),
      ),
    );
  }
}

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isChecked = false; // Variabel untuk menyimpan status checkbox

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView( // Tambahkan SingleChildScrollView untuk scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text(
              "Data dan Keamanan Anda",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Tinjau Kebijakan Privasi serta Syarat & Ketentuan untuk memastikan Anda puas dengan cara kami mengumpulkan informasi Anda.",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(Icons.privacy_tip_outlined,
                    size: 24, color: Colors.green),
                const SizedBox(width: 10),
                Text(
                  "Kebijakan Privasi",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Kami memprioritaskan Privasi Anda. Kami menjaga privasi dan keamanan data Anda dengan sangat serius.",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "BAGIAN PENTING KEBIJAKAN PRIVASI KAMI",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Data Anda hanya akan digunakan untuk memverifikasi identitas guna menyelesaikan proses pengajuan visa.",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            Text(
              "Semua data pribadi akan otomatis dihapus dari aplikasi setelah pendaftaran selesai.",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman kebijakan.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyScreenApp1()),
                );
              },
              child: Text(
                "Baca selengkapnya Kebijakan Privasi",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(Icons.description, size: 24, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  "Syarat & Ketentuan",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Untuk menggunakan layanan Pendaftaran Seluler, Anda harus menyetujui Syarat dan ketentuan.",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 27, 153, 237),
                ),
                Expanded(
                  child: Text(
                    "Saya telah membaca dan menyetujui kebijakan Privasi dan Syarat & Ketentuan",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: _isChecked
                    ? () {
                  // Navigasi ke halaman daftar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DaftarPage()),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: const Color(0xFF00458B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Mulai Pendaftaran Mandiri",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
