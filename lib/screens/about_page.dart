import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const AboutPage({Key? key, required this.language}) : super(key: key);

  Future openUrl(Uri uri) async {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  // Fungsi untuk menerjemahkan teks berdasarkan bahasa
  String _translate(String en, String id) {
    return language == 'en' ? en : id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _translate("About App", "Tentang Aplikasi"),
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Ubah padding menjadi horizontal saja
        child: Center( // Tambahkan Center widget
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Ubah menjadi center
            children: [
              Image.asset(
                'assets/images/TanaLeaf_Logo.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              Text(
                'TanaLeaf',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _translate('Version: 1.0.0', 'Versi: 1.0.0'),
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                _translate('Developed by:', 'Dikembangkan oleh:'),
                style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => openUrl(Uri.parse('https://github.com/Rifqi2407')),
                child: Text(
                  'Rifqi Hidayat',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 6, 10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => openUrl(Uri.parse('https://github.com/Rifqi2407')),
                child: Text(
                  _translate('Visit GitHub', 'Kunjungi GitHub'),
                  style: GoogleFonts.roboto(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
