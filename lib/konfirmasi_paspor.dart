import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_flutter/periksa_detail.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'periksa_detail.dart';
import 'dart:convert';

class ConfirmPhotoScreen extends StatefulWidget {
  final File image; // The scanned image file

  const ConfirmPhotoScreen({super.key, required this.image});

  @override
  _ConfirmPhotoScreenState createState() => _ConfirmPhotoScreenState();
}

class _ConfirmPhotoScreenState extends State<ConfirmPhotoScreen> {
  late File _image; // Use a variable to hold the image state

  @override
  void initState() {
    super.initState();
    _image = widget.image; // Initialize with the passed image
  }

  // Function to pick image from the camera
  Future<void> _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image state with new scan
      });
    }
  }

  // Function to pick image from the gallery
  Future<void> _pickImageFromGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image state
      });
    }
  }

  // Function to send the image to the API
  Future<void> _uploadImage(File image, BuildContext context) async {
    final url = Uri.parse(
        'https://c18e-182-0-249-237.ngrok-free.app/ocr'); // Replace with your API URL
    print(url);
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath(
      'image', // Name of the file field in the API
      image.path,
    ));

    // Send request
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        var jsonResult = jsonDecode(responseBody);

        print(jsonResult);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PassportVerificationApp(passportData: jsonResult),
          ),
        );
      } else {
        // Handle error
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

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
                  fontSize: 15,
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
                      aspectRatio: 4 / 3, // Set aspect ratio (e.g., 4:3)
                      child: Image.file(
                        _image,
                        fit: BoxFit.contain, // Adjust image fit
                      ),
                    ),
                  ),
                  const Positioned(
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
                          onPressed: () async {
                            // Call camera for scanning
                            await _pickImageFromCamera();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 22, 72, 113)),
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
                          onPressed: () => _pickImageFromGallery(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                color: Color.fromARGB(255, 22, 72, 113)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'Upload Foto',
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 22, 72, 113),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: double.infinity, // Make the button take full width
                      child: ElevatedButton(
                        onPressed: () async {
                          await _uploadImage(_image,
                              context); // Upload the image when Lanjutkan is clickeds
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 22, 72, 113),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Lanjutkan',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
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
