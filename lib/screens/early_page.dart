import 'package:flutter/material.dart';

class EarlyPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const EarlyPage({Key? key, required this.language}) : super(key: key);

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
        title: Text(_translate("Early Blight", "Penyakit Hawar Awal")),
      ),
      body: SingleChildScrollView( // Menambahkan scroll view untuk teks panjang
        child: Center(
          child: buildBoxDecoration(
            _translate(
              "Early Blight in potato plants is caused by the fungus Alternaria solani and typically occurs in warm and humid areas. Symptoms include brown spots on the leaves with yellow edges, which then dry up and lead to reduced yield. This disease can decrease tuber quality and affect overall plant growth. Control methods include crop rotation, use of resistant varieties, proper fungicide application, and sanitation to reduce the spread of fungal spores in the soil and plant residues.",
              "Hawar Awal pada tanaman kentang disebabkan oleh jamur Alternaria solani dan umumnya terjadi di daerah yang hangat dan lembap. Gejalanya termasuk bercak coklat pada daun yang diapit oleh tepi kuning, yang kemudian mengering dan mengakibatkan penurunan hasil. Penyakit ini dapat mengurangi kualitas umbi dan mempengaruhi pertumbuhan tanaman secara keseluruhan. Pengendalian termasuk rotasi tanaman, penggunaan varietas tahan, aplikasi fungisida yang tepat, dan sanitasi untuk mengurangi penyebaran spora jamur di tanah dan sisa-sisa tanaman."
            ),
            'assets/images/Early_Blight.png',
          ),
        ),
      ),
    );
  }
}
