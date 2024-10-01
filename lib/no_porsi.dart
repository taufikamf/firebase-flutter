import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pindai.dart';

void main() {
  runApp(const Porsi());
}

class Porsi extends StatelessWidget {
  const Porsi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visa Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nomor Porsi'),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        body: const InquiryForm(),
      ),
    );
  }
}

class InquiryForm extends StatefulWidget {
  const InquiryForm({super.key});

  @override
  _InquiryFormState createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nomorPorsiController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Masukkan Nomor Porsi Anda:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nomorPorsiController,
              decoration: const InputDecoration(
                labelText: 'Nomor Porsi',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                // Hilangkan box shadow untuk tampilan lebih polos
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Nomor Porsi: ${_nomorPorsiController.text}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PassportScanApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 20),
                  backgroundColor: const Color(0xFF00458B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Lanjutkan',
                  style: TextStyle(
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