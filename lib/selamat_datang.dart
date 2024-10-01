import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart'; // Import SyaratScreen

class SelamatDatang extends StatelessWidget {
  const SelamatDatang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for the title, line, and logo
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text
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
                    const SizedBox(width: 12),
                    // Vertical Line on the right side of the text
                    Container(
                      width: 4, // Thickness of the line
                      height: 60, // Height of the line
                      color: Colors.black, // Line color changed to black
                    ),
                    const SizedBox(width: 12), // Add some spacing
                    // Logo next to the line
                    Image.asset(
                      'assets/logo_kemenag.png', // Adjust the asset path
                      height: 75,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Welcome Text
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
                const SizedBox(height: 20),

                // Illustration
                Center(
                  child: Image.asset(
                    'assets/gambar_2.png', // Adjust the asset path for the illustration
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),

                // Important Information Section
                Text(
                  'Informasi penting sebelum memulai',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Aplikasi ini akan mengumpulkan nomor porsi dan paspor Anda sebagai bagian dari proses pengajuan visa.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Semua pemohon diminta untuk menyerahkan informasi pribadi, dokumen yang diperlukan, serta pembayaran sebelum pengajuan visa diproses.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),

                // Information Box (Details to be collected)
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
                            Icons.confirmation_number_outlined,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Nomor Porsi',
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
                const SizedBox(height: 30),

                // Button to Proceed
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 16),
                      backgroundColor: const Color(0xFF00458B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Proper rounding for the button
                      ),
                    ),
                    child: Text(
                      'Mulai',
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
