import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'konfirmasi_paspor.dart'; // Import the ConfirmPhotoScreen

void main() {
  runApp(const PassportScanApp());
}

class PassportScanApp extends StatelessWidget {
  const PassportScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passport Scan App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PassportScanScreen(),
    );
  }
}

class PassportScanScreen extends StatefulWidget {
  const PassportScanScreen({super.key});

  @override
  _PassportScanScreenState createState() => _PassportScanScreenState();
}

class _PassportScanScreenState extends State<PassportScanScreen> {
  File? _image; // Variable to store the scanned image

  // Function to pick image from camera
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // After the image is picked, navigate to the confirm screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPhotoScreen(image: _image!), // Pass the scanned image
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Tambahkan SingleChildScrollView untuk scroll
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              // Title
              Text(
                "Pemindaian Paspor",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Subtitle
              Text(
                "Dengan menggunakan kamera belakang ponsel, pindai paspor anda.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 40),
              // Image Placeholder or scanned image
              Center(
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    _image!,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                )
                    : Image.asset(
                  'assets/paspor.png', // Replace with your asset image path
                  height: 280,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
              // Instruction Box
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 129, 167, 218), // Light blue color
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Untuk Hasil Terbaik",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Jaga agar dokumen tetap lurus dan tidak bergerak",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Ambil di tempat yang cukup terang",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Pastikan tidak ada sorotan cahaya atau bayangan pada paspor",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              // Scan Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _pickImageFromCamera, // Trigger the camera function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Pindai Paspor',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
