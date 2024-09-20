import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'syarat.dart'; // Import SyaratScreen

class SelamatDatang extends StatelessWidget {
  const SelamatDatang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Indonesia',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00458B),
                          ),
                        ),
                        Text(
                          'Visa Bio',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00458B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 60,
                      width: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/logo_kemenag.png',
                      height: 80,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Selamat Datang di Aplikasi Indonesia Visa Bio',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kementrian Agama Republik Indonesia',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    'assets/gambar_2.png',
                    height: 200,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Informasi penting sebelum memulai',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Aplikasi ini akan mengumpulkan email, dan paspor Anda sebagai bagian dari proses pendaftaran aplikasi visa Anda.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Semua pemohon diminta untuk menyerahkan informasi pribadi, dokumen yang diminta serta pembayaran sebelum aplikasi visa diproses.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20), // Increased spacing

                // Bagian detail yang akan dikumpulkan
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Alamat email Anda valid',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 80, 89, 95),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.account_box,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Penangkapan foto paspor Anda dan detail paspor',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 80, 89, 95),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30), // Adjusted spacing

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SyaratScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      backgroundColor: const Color(0xFF00458B),
                    ),
                    child: Text(
                      'MULAI PENDAFTARAN MANDIRI',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
