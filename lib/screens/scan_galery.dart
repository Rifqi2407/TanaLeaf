import 'package:flutter/material.dart';

class ScanGaleryPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const ScanGaleryPage({Key? key, required this.language}) : super(key: key);

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
        title: Text(_translate("Scan Gallery", "Pindai Galeri")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildBoxDecoration(
                _translate("Scan Gallery", "Pindai Galeri"),
                language == 'en'
                    ? [
                        "1. Open the App : Start by opening the app on your phone that you have downloaded and installed.",
                        "2. Select Gallery Mode : Choose the option or mode that allows users to select photos from their phone's gallery.",
                        "3. Choose Photo : Browse your phone's gallery and select a photo of the potato plant leaf you want to analyze for disease detection. Ensure the photo is clear and includes leaves with suspicious symptoms.",
                        "4. Automatic Analysis : After selecting the photo, the app will automatically analyze the image to identify disease symptoms such as spots, discoloration, or deformities.",
                        "5. Interpret Results: Receive analysis results showing the type of disease and its severity based on the selected photo.",
                        "6. Next Steps : Based on the analysis results, the app typically provides recommendations on appropriate control or treatment steps to take."
                      ]
                    : [
                        "1. Buka Aplikasi : Mulailah dengan membuka aplikasi di ponsel yang telah diunduh dan diinstal.",
                        "2. Pilih Mode Galeri : Pilih opsi atau mode yang memungkinkan pengguna untuk memilih foto dari galeri ponsel mereka.",
                        "3. Pilih Foto : Telusuri galeri ponsel dan pilih foto daun tanaman kentang yang ingin dianalisis untuk deteksi penyakit. Pastikan foto tersebut jelas dan memuat daun dengan gejala yang mencurigakan.",
                        "4. Analisis Otomatis : Setelah memilih foto, aplikasi akan melakukan analisis otomatis terhadap gambar untuk mengidentifikasi gejala penyakit seperti bercak, perubahan warna, atau deformasi.",
                        "5. Interpretasi Hasil : Terima hasil analisis yang menunjukkan jenis penyakit dan tingkat keparahan berdasarkan foto yang dipilih.",
                        "6. Tindakan Selanjutnya : Berdasarkan hasil analisis, aplikasi biasanya memberikan rekomendasi tentang langkah-langkah pengendalian atau perawatan yang tepat untuk dilakukan."
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
