import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'resume.dart'; // Ensure you have the correct import paths
import 'konfirmasi_paspor.dart'; // Import the ConfirmPhotoScreen

void main() {
  runApp(const MaterialApp(home: PassportVerificationApp(passportData: null)));
}

class PassportVerificationApp extends StatelessWidget {
  final Map<String, dynamic>? passportData;

  const PassportVerificationApp({super.key, this.passportData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PassportVerificationScreen(passportData: passportData),
    );
  }
}

class PassportVerificationScreen extends StatefulWidget {
  final Map<String, dynamic>? passportData;

  const PassportVerificationScreen({super.key, this.passportData});

  @override
  _PassportVerificationScreenState createState() => _PassportVerificationScreenState();
}

class _PassportVerificationScreenState extends State<PassportVerificationScreen> {
  File? _scannedImage; // Variable to hold the scanned image
  late Map<String, dynamic> _passportData;
  final TextEditingController issuingOfficeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passportData = widget.passportData ?? {};
    print('Passport Data: $_passportData'); // Print the passportData
  }

  @override
  void dispose() {
    issuingOfficeController.dispose();
    super.dispose();
  }

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
            _buildTextField("Nomor paspor", _passportData['number'] ?? ""),
            _buildTextField("Kewarganegaraan", _passportData['nationality'] ?? ""),
            _buildTextField("Tanggal Lahir", _passportData['date_of_birth'] ?? ""),
            _buildTextField("Nama Belakang", _passportData['surname'] ?? ""),
            _buildTextField("Nama Depan", _passportData['names'] ?? ""),
            _buildTextField("Tanggal Habis Masa Berlaku", _passportData['expiration_date'] ?? ""),
            _buildTextField("Jenis Kelamin", _passportData['sex'] ?? ""),
            _buildTextField("MRZ 1", _passportData['raw_first'] ?? ""),
            _buildTextField("MRZ 2", _passportData['raw_second'] ?? ""),

            // Updated field for "Kantor Yang Mengeluarkan"
            Text(
              "Kantor Yang Mengeluarkan",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: issuingOfficeController,
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Row for buttons
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
                      color: const Color.fromARGB(255, 22, 72, 113),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Update the passport data with the issuing office
                    _passportData['issuing_office'] = issuingOfficeController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PassportResumeScreen(
                          scannedImage: _scannedImage,
                          passportData: _passportData,
                        ),
                      ),
                    );
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

  Widget _buildTextField(String label, String initialValue) {
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
        TextFormField(
          initialValue: initialValue,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
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
