import 'package:flutter/material.dart';

class ManageNormalPage extends StatelessWidget {
  final String language; // Parameter bahasa

  const ManageNormalPage({Key? key, required this.language}) : super(key: key);

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
              fontSize: 18, // Ukuran font diperbesar
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
                  fontSize: 16, // Ukuran font diperbesar
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
        title: Text(_translate("Manage Normal", "Normal")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildBoxDecoration(
                _translate("General Disease Management for Potatoes", "Penanganan Umum Penyakit pada Kentang"),
                [
                  _translate("1. Proper Nutrition : Maintaining soil nutrient balance to keep plants healthy and resistant to diseases.", "1. Pemberian Nutrisi yang Tepat : Menjaga keseimbangan hara dalam tanah agar tanaman tetap sehat dan tahan terhadap penyakit."),
                  _translate("2. Proper Irrigation : Avoiding waterlogging that can increase humidity and promote pathogen growth.", "2. Pengairan yang Tepat : Menghindari genangan air yang dapat meningkatkan kelembaban dan memicu pertumbuhan patogen."),
                  _translate("3. Removal of Infected Plant Parts : Promptly removing and destroying plant parts showing disease symptoms.", "3. Pembuangan Bagian Tanaman yang Terinfeksi : Segera membuang dan memusnahkan bagian tanaman yang menunjukkan gejala penyakit."),
                  _translate("4. Mulching : Using mulch to reduce water splash from the soil to the leaves, which can carry pathogens.", "4. Pemberian Mulsa : Menggunakan mulsa untuk mengurangi percikan air dari tanah ke daun yang bisa membawa patogen."),
                  _translate("5. Regular Monitoring : Regularly monitoring plants to detect disease symptoms early for timely management.", "5. Pemantauan Rutin : Memantau tanaman secara rutin untuk mendeteksi dini gejala-gejala penyakit sehingga penanganan dapat dilakukan lebih awal."),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
