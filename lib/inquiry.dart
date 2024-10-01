import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'pindai.dart';

void main() {
  runApp(const InfoDasar());
}

class InfoDasar extends StatelessWidget {
  const InfoDasar({super.key});

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
        scaffoldBackgroundColor: Colors.white, // Mengatur warna latar belakang scaffold
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Dasar'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: const SafeArea(
        child: InquiryForm(),
      ),
    );
  }
}

class InquiryForm extends StatefulWidget {
  const InquiryForm({super.key});

  @override
  _InquiryFormState createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm> {
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _ttlController = TextEditingController();
  final TextEditingController _namaAyahController = TextEditingController();
  final TextEditingController _tglLunasController = TextEditingController();
  final TextEditingController _kabupatenController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Masukkan informasi berikut untuk melanjutkan:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 32),

          // Nama Lengkap
          TextFormField(
            controller: _namaLengkapController,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Tempat Tanggal Lahir
          TextFormField(
            controller: _ttlController,
            decoration: InputDecoration(
              labelText: 'Tempat, Tanggal Lahir',
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context, _ttlController),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Nama Ayah
          TextFormField(
            controller: _namaAyahController,
            decoration: const InputDecoration(
              labelText: 'Nama Ayah',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Tanggal Lunas
          TextFormField(
            controller: _tglLunasController,
            decoration: InputDecoration(
              labelText: 'Tanggal Lunas',
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context, _tglLunasController),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Kabupaten
          TextFormField(
            controller: _kabupatenController,
            decoration: const InputDecoration(
              labelText: 'Kabupaten',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),

          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Nama Lengkap: ${_namaLengkapController.text}');
                print('TTL: ${_ttlController.text}');
                print('Nama Ayah: ${_namaAyahController.text}');
                print('Tanggal Lunas: ${_tglLunasController.text}');
                print('Kabupaten: ${_kabupatenController.text}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PassportScanScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 20),
                backgroundColor: const Color(0xFF00458B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Lanjutkan',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}