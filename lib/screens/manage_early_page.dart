import 'package:flutter/material.dart';

class ManageEarlyPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const ManageEarlyPage({Key? key, required this.language}) : super(key: key);

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
        title: Text(_translate("Manage Early Blight", "Kelola Hawar Awal")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildBoxDecoration(
                _translate("Early Blight (Alternaria solani)", "Early Blight (Alternaria solani)"),
                [
                  _translate(
                    "1. Crop Rotation : Replacing potato plants with non-solanaceous crops helps reduce pathogen populations in the soil.",
                    "1. Rotasi Tanaman : Mengganti tanaman kentang dengan tanaman lain yang tidak sejenis dapat membantu mengurangi populasi patogen di dalam tanah.",
                  ),
                  _translate(
                    "2. Resistant Varieties : Planting potato varieties resistant to early blight.",
                    "2. Penggunaan Varietas Tahan : Menanam varietas kentang yang tahan terhadap early blight.",
                  ),
                  _translate(
                    "3. Sanitation : Removing infected plant debris and maintaining cleanliness of the field.",
                    "3. Sanitasi : Menghilangkan sisa-sisa tanaman yang terinfeksi dan menjaga kebersihan lahan.",
                  ),
                  _translate(
                    "4. Fungicides : Application of fungicides containing active ingredients like chlorothalonil, mancozeb, or azoxystrobin to help control the disease.",
                    "4. Fungisida : Aplikasi fungisida yang mengandung bahan aktif seperti chlorothalonil, mancozeb, atau azoxystrobin dapat membantu mengendalikan penyakit ini.",
                  ),
                  _translate(
                    "5. Proper Irrigation : Avoiding overhead watering which keeps leaves wet. Watering should be done at the base of the plants.",
                    "5. Pengairan yang Baik : Menghindari penyiraman dari atas yang bisa membuat daun tetap basah. Penyiraman sebaiknya dilakukan di pangkal tanaman.",
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
