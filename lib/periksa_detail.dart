import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(const PassportVerificationApp());
}

class PassportVerificationApp extends StatelessWidget {
  const PassportVerificationApp({super.key});

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

  // Function to pick image from the camera
  Future<void> _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _scannedImage = File(pickedFile.path); // Save the picked image
      });
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
                fontSize: 14.8,
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
                  onPressed: () async {
                    await _pickImageFromCamera(); // Call the function to pick image
                    if (_scannedImage != null) {
                      // Navigate to the confirm screen with the scanned image
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmPhotoScreen(image: _scannedImage!), // Pass the scanned image to the confirm screen
                        ),
                      );
                    }
                  },
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

class ConfirmPhotoScreen extends StatefulWidget {
  final File image; // The scanned image file

  const ConfirmPhotoScreen({Key? key, required this.image}) : super(key: key);

  @override
  _ConfirmPhotoScreenState createState() => _ConfirmPhotoScreenState();
}

class _ConfirmPhotoScreenState extends State<ConfirmPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Return to previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Konfirmasi Foto Paspor',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Pastikan hasil foto jelas, sehingga kami dapat memverifikasi data anda',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Display the scanned image
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.file(
                        widget.image, // Use the image passed from the previous screen
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context); // Back to scan again
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(color: Color.fromARGB(255, 22, 72, 113)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Coba Pindai Lagi',
                            style: GoogleFonts.poppins(
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add logic for "Upload Foto" if needed
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: const Color(0xFF00458B), // Change this if needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Upload Foto',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
