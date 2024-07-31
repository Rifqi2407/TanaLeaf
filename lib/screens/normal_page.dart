import 'package:flutter/material.dart';

class NormalPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const NormalPage({Key? key, required this.language}) : super(key: key);

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
                fontSize: 16, // Ukuran font diperbesar untuk konsistensi
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
        title: Text(_translate("Normal", "Normal")),
      ),
      body: SingleChildScrollView( // Menambahkan scroll view untuk teks panjang
        child: Center(
          child: buildBoxDecoration(
            _translate(
              "Normal diseases in potato plants are caused by suboptimal environmental conditions such as water deficiency or excess, nutrient deficiencies, extreme temperatures, or inadequate lighting. Symptoms include stunted growth, yellowing leaves, tuber deformities, or leaf spots. Prevention and management include proper watering and fertilization, protection from extreme temperatures, and pest and weed control to maintain optimal growing conditions.",
              "Penyakit Normal pada tanaman kentang disebabkan oleh kondisi lingkungan yang kurang ideal seperti kekurangan atau kelebihan air, defisiensi hara, suhu ekstrem, atau pencahayaan yang tidak memadai. Gejalanya meliputi pertumbuhan terhambat, daun menguning, deformasi umbi, atau bintik-bintik pada daun. Pencegahan dan penanganan meliputi pemberian air dan pupuk yang tepat, perlindungan dari suhu ekstrem, dan pengelolaan hama serta gulma untuk menjaga kondisi tumbuh yang optimal."
            ),
            'assets/images/Normal.png',
          ),
        ),
      ),
    );
  }
}
