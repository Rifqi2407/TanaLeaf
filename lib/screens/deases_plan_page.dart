import 'package:flutter/material.dart';
import 'normal_page.dart';
import 'early_page.dart';  
import 'late.dart';

class DeasesPlanPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const DeasesPlanPage({Key? key, required this.language}) : super(key: key);

  Color get primaryColor => const Color(0xffFFBB38);

  // Fungsi untuk menerjemahkan teks berdasarkan bahasa
  String _translate(String en, String id) {
    return language == 'en' ? en : id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_translate("Disease Plan", "Penyakit Tanaman")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContactItem(
              context,
              _translate("Normal", "Normal"),
              "assets/images/Normal.png", 
              NormalPage(language: language),
            ),
            _buildContactItem(
              context,
              _translate("Early Blight", "Penyakit Hawar Awal"),
              "assets/images/Early_Blight.png", 
              EarlyPage(language: language),
            ),
            _buildContactItem(
              context,
              _translate("Late Blight", "Penyakit Hawar Akhir"),
              "assets/images/Late_Blight.png", 
              LatePage(language: language),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String title,
    String imagePath, 
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row( 
          children: [
            Image.asset(imagePath, width: 50, height: 50), 
            const SizedBox(width: 10), 
            Expanded( 
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
