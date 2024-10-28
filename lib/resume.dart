import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(home: PassportResumeScreen()));
}

class PassportResumeScreen extends StatelessWidget {
  final File? scannedImage;
  final Map<String, dynamic>? passportData;

  const PassportResumeScreen({super.key, this.scannedImage, this.passportData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Resume",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              if (scannedImage != null)
                Center(
                  child: Image.file(
                    scannedImage!,
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 20),

              // Container to hold all fields
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField("Nomor paspor", passportData?['number'] ?? ""),
                    _buildTextField("Kewarganegaraan", passportData?['nationality'] ?? ""),
                    _buildTextField("Tanggal Lahir", passportData?['date_of_birth'] ?? ""),
                    _buildTextField("Nama Belakang", passportData?['surname'] ?? ""),
                    _buildTextField("Nama Depan", passportData?['names'] ?? ""),
                    _buildTextField("Tanggal Habis Masa Berlaku", passportData?['expiration_date'] ?? ""),
                    _buildTextField("Jenis Kelamin", passportData?['sex'] ?? ""),
                    _buildTextField("MRZ 1", passportData?['raw_first'] ?? ""),
                    _buildTextField("MRZ 2", passportData?['raw_second'] ?? ""),
                    _buildTextField("Kantor Yang Mengeluarkan", passportData?['issuing_office'] ?? ""),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implementasikan logika lanjutan
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Text(
              "$label:",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
