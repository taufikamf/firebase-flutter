import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'konfirmasi_paspor.dart'; // Import the ConfirmPhotoScreen

void main() {
  runApp(const PassportVerificationApp());
}

class PassportVerificationApp extends StatelessWidget {

final JSON passportData;
  const PassportVerificationApp({Key? key, required this.passporData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: PassportVerificationScreen(),
      ),
    );
  }
}

class PassportVerificationScreen extends StatefulWidget {
  const PassportVerificationScreen({super.key});

  @override
  _PassportVerificationScreenState createState() => _PassportVerificationScreenState();
}

class _PassportVerificationScreenState extends State<PassportVerificationScreen> {
  File? _scannedImage; // Variable to hold the scanned image

  // Function to pick image from the camera and navigate to the confirm screen
  Future<void> _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _scannedImage = File(pickedFile.path); // Save the picked image
      });

      // Navigate to the ConfirmPhotoScreen with the scanned image
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPhotoScreen(image: _scannedImage!), // Pass the scanned image to the confirm screen
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              "Konfirmasikan Detail Anda",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Periksa detail yang diambil sebelum melanjutkan",
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            _buildTextField("Nomor paspor", "Nomor paspor"),
            _buildTextField("Kewarganegaraan", "Kewarganegaraan"),
            _buildTextField("Tanggal Lahir", "Tanggal Lahir"),
            _buildTextField("Nama Keluarga", "Nama Keluarga"),
            _buildTextField("Nama Depan", "Nama Depan"),
            _buildTextField("Tanggal Habis Masa Berlaku", "Tanggal Habis Masa Berlaku"),
            _buildTextField("Jenis Kelamin", "Jenis Kelamin"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _pickImageFromCamera, // Call the function to pick image and navigate
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color.fromARGB(255, 22, 72, 113)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Coba Pindai Lagi",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color.fromARGB(255, 22, 72, 113),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lanjutkan dengan logika untuk navigasi atau lainnya
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: const Color(0xFF00458B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Lanjutkan",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
