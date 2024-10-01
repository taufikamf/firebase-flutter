import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data_keamanan.dart'; // Import file data_keamanan.dart

void main() {
  runApp(PrivacyScreenApp1());
}

class PrivacyScreenApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrivacyScreen(),
    );
  }
}

class PrivacyScreen extends StatefulWidget {
  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isChecked = false; // Variable to manage checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // Navigasi ke halaman lain jika diperlukan
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PrivacyScreenApp()), // Pastikan PrivacyScreenApp ada
            );
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.privacy_tip_outlined,
                        size: 24, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      "Kebijakan Privasi",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Kami mengumpulkan data pribadi Anda hanya untuk tujuan yang jelas dan sah, seperti pemrosesan aplikasi visa dan verifikasi informasi. Data pribadi yang kami kumpulkan meliputi nama, alamat, tanggal lahir, nomor paspor, dan informasi relevan lainnya yang diperlukan untuk memproses permohonan visa Anda.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  "Penggunaan Data",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Data pribadi yang Anda berikan akan digunakan semata-mata untuk memproses aplikasi visa Anda dan untuk tujuan administratif yang terkait. Kami tidak akan menggunakan data Anda untuk tujuan lain tanpa persetujuan Anda, kecuali jika diwajibkan oleh hukum.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  "Keamanan Data",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Kami berkomitmen untuk melindungi data pribadi Anda dengan menggunakan langkah-langkah keamanan yang sesuai. Kami menerapkan teknologi enkripsi dan prosedur keamanan lainnya untuk melindungi data dari akses, perubahan, atau pengungkapan yang tidak sah.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  "Penyimpanan Data",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Data pribadi Anda akan disimpan hanya selama periode yang diperlukan untuk memenuhi tujuan pengumpulan data atau sesuai dengan persyaratan hukum yang berlaku. Setelah periode tersebut, data Anda akan dihapus atau dianonimkan dengan cara yang aman.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  "Hak Akses dan Kontrol",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Anda berhak untuk mengakses data pribadi Anda yang kami miliki dan meminta perbaikan jika terdapat ketidakakuratan. Jika Anda ingin mengakses atau memperbarui data Anda, atau jika Anda memiliki pertanyaan tentang kebijakan privasi ini, silakan hubungi kami melalui informasi kontak yang tersedia di situs web kami.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  "Perubahan Kebijakan",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Setiap perubahan akan diumumkan di situs web kami dan berlaku efektif sejak tanggal pengumuman.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  "Kontak Kami",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Jika Anda memiliki pertanyaan mengenai kebijakan privasi ini atau tentang cara kami mengelola data pribadi Anda, silakan hubungi kami di birohdi@kemenag.go.id atau 021 348 3304-20.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
