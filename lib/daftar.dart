import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';
import 'login.dart'; // Pastikan file ini ada di proyek

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<dynamic> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }

      print('Google User: ${googleUser.displayName}');

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in as ${user.displayName}')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(user: user)),
        );
      }
    } catch (e) {
      print('Sign-in error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/backgrounddd.png', // Ganti dengan path gambar background yang diinginkan
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 250), // Jarak dari atas
                  Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center, // Memposisikan di tengah
                    child: SizedBox(
                      width: 340, // Atur ukuran lebar box Email
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password Input
                  Align(
                    alignment: Alignment.center, // Memposisikan di tengah
                    child: SizedBox(
                      width: 340, // Atur ukuran lebar box Password
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                  // Button Login with Google

                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Atau daftar dengan',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: _signInWithGoogle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        elevation: 5,
                      ),
                      icon: Image.asset(
                        'assets/google.png', // Ikon Google
                        width: 24,
                        height: 24,
                      ),
                      label: Text(
                        'Login dengan Google',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Sudah memiliki akun?? ',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Masuk',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()), // Navigasi ke halaman Daftar
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSocialIcon(String assetPath) {
  return Container(
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.circle,
    ),
    child: Image.asset(
      assetPath,
      width: 24,
      height: 24,
    ),
  );
}