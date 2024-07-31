import 'package:flutter/material.dart';

class LatePage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const LatePage({Key? key, required this.language}) : super(key: key);

  Color get primaryColor => const Color(0xffFFBB38);

  // Fungsi untuk menerjemahkan teks berdasarkan bahasa
  String _translate(String en, String id) {
    return language == 'en' ? en : id;
  }

  Widget buildBoxDecoration(String text, String imagePath) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            width: 50, // adjust the width as needed
            height: 50, // adjust the height as needed
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16, // Ukuran font diperbesar untuk teks
                color: Colors.black,
              ),
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
        title: Text(_translate("Late Blight", "Penyakit Hawar Akhir")),
      ),
      body: SingleChildScrollView( // Menambahkan scroll view untuk teks panjang
        child: Center(
          child: buildBoxDecoration(
            _translate(
              "Late Blight, caused by Phytophthora infestans, is a fungal disease that widely damages potato plants worldwide. This disease is characterized by dark, water-soaked lesions on leaves, stems, and tubers, which quickly turn into brown patches and necrosis. It spreads rapidly in cool and moist environments, especially during wet weather and when strong winds facilitate the spread of spores. Early detection and proper fungicide use are crucial for controlling this infection, along with crop rotation, soil drainage improvement, and strict sanitation to eliminate sources of infection.",
              "Hawar Akhir, atau Phytophthora infestans, adalah penyakit jamur yang merusak tanaman kentang secara luas di seluruh dunia. Penyakit ini ditandai dengan lesi gelap berair pada daun, batang, dan umbi kentang, yang cepat berubah menjadi bercak coklat dan nekrosis. Penyakit ini menyebar dengan cepat di lingkungan yang sejuk dan lembap, terutama saat cuaca basah dan angin kencang mempermudah penyebaran spora. Deteksi dini dan penggunaan fungisida yang tepat sangat penting untuk mengendalikan infeksi ini, bersama dengan rotasi tanaman, perbaikan drainase tanah, dan sanitasi yang ketat untuk menghilangkan sumber infeksi."
            ),
            'assets/images/Late_Blight.png',
          ),
        ),
      ),
    );
  }
}
