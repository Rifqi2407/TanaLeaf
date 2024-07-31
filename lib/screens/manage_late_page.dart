import 'package:flutter/material.dart';

class ManageLatePage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const ManageLatePage({Key? key, required this.language}) : super(key: key);

  Color get primaryColor => const Color(0xffFFBB38);

  // Fungsi untuk menerjemahkan teks berdasarkan bahasa
  String _translate(String en, String id) {
    return language == 'en' ? en : id;
  }

  Widget buildBoxDecoration(String title, List<String> contents) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18, // Ukuran font diperbesar untuk judul
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 10), // Jarak antara judul dan konten
          for (var content in contents)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 16, // Ukuran font diperbesar untuk konten
                ),
                textAlign: TextAlign.justify, // Rata kanan-kiri
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_translate("Manage Late Blight", "Kelola Hawar Akhir")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildBoxDecoration(
                _translate("Late Blight (Phytophthora infestans)", "Late Blight (Phytophthora infestans)"),
                [
                  _translate(
                    "1. Healthy Seed Selection : Use disease-free seeds.",
                    "1. Pemilihan Benih Sehat : Menggunakan benih yang bebas dari penyakit.",
                  ),
                  _translate(
                    "2. Crop Rotation : Like early blight, crop rotation can help prevent pathogen spread.",
                    "2. Rotasi Tanaman : Seperti pada early blight, rotasi tanaman dapat membantu mencegah penyebaran patogen.",
                  ),
                  _translate(
                    "3. Sanitation and Plant Management : Remove and destroy infected plant debris.",
                    "3. Sanitasi dan Pengelolaan Tanaman : Menghilangkan dan memusnahkan sisa-sisa tanaman yang terinfeksi.",
                  ),
                  _translate(
                    "4. Fungicides : Application of preventive and curative fungicides like metalaxyl, mancozeb, or copper fungicides. Apply regularly, especially during weather conditions favorable for disease development.",
                    "4. Fungisida : Aplikasi fungisida preventif dan kuratif seperti metalaxyl, mancozeb, atau copper fungicides. Aplikasi dilakukan secara berkala terutama saat kondisi cuaca mendukung perkembangan penyakit.",
                  ),
                  _translate(
                    "5. Plant Spacing : Plant with adequate spacing to allow good air circulation around the plants.",
                    "5. Pengaturan Jarak Tanam : Menanam dengan jarak yang cukup untuk memungkinkan sirkulasi udara yang baik di sekitar tanaman.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
