import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  final List<Map<String, dynamic>> recognitions;
  final String language;

  const AnalysisPage({Key? key, required this.recognitions, required this.language}) : super(key: key);

  Color get primaryColor => const Color(0xffFFBB38);

  String getDiseaseDescription(String label) {
    if (language == 'en') {
      switch (label) {
        case "0 Bukan Daun Kentang":
          return "This is not a potato leaf. Please ensure the image taken is of a potato leaf.";
        case "1 Potato___Early_blight":
          return "Early Blight on potato plants is caused by the fungus Alternaria solani and commonly occurs in warm, humid areas. Symptoms include brown spots on leaves surrounded by yellow margins, which then dry out and cause yield reduction. This disease can reduce tuber quality and affect overall plant growth.";
        case "2 Potato___Late_blight":
          return "Late Blight, or Phytophthora infestans, is a fungal disease that severely damages potato plants worldwide. It is characterized by dark, water-soaked lesions on leaves, stems, and tubers, which quickly turn brown and necrotic. The disease spreads rapidly in cool, moist environments, especially when wet weather and strong winds facilitate spore dispersal.";
        case "3 Potato___healthy":
          return "The potato plant is healthy. No signs of disease detected.";
        default:
          return "Label not recognized.";
      }
    } else { // Bahasa Indonesia
      switch (label) {
        case "0 Bukan Daun Kentang":
          return "Ini bukan daun kentang. Pastikan gambar yang diambil adalah daun kentang.";
        case "1 Potato___Early_blight":
          return "Early Blight pada tanaman kentang disebabkan oleh jamur Alternaria solani dan umumnya terjadi di daerah yang hangat dan lembap. Gejalanya termasuk bercak coklat pada daun yang diapit oleh tepi kuning, yang kemudian mengering dan mengakibatkan penurunan hasil. Penyakit ini dapat mengurangi kualitas umbi dan mempengaruhi pertumbuhan tanaman secara keseluruhan.";
        case "2 Potato___Late_blight":
          return "Late Blight, atau Phytophthora infestans, adalah penyakit jamur yang merusak tanaman kentang secara luas di seluruh dunia. Penyakit ini ditandai dengan lesi gelap berair pada daun, batang, dan umbi kentang, yang cepat berubah menjadi bercak coklat dan nekrosis. Penyakit ini menyebar dengan cepat di lingkungan yang sejuk dan lembap, terutama saat cuaca basah dan angin kencang mempermudah penyebaran spora.";
        case "3 Potato___healthy":
          return "Tanaman kentang dalam kondisi sehat. Tidak ada tanda-tanda penyakit yang terdeteksi.";
        default:
          return "Label tidak dikenali.";
      }
    }
  }

  String getDiseaseManagement(String label) {
    if (language == 'en') {
      switch (label) {
        case "1 Potato___Early_blight":
          return "Management includes crop rotation, use of resistant varieties, appropriate fungicide application, and sanitation to reduce the spread of fungal spores in soil and plant debris.";
        case "2 Potato___Late_blight":
          return "Early detection and appropriate fungicide use are crucial to control this infection, along with crop rotation, soil drainage improvement, and strict sanitation to remove infection sources.";
        case "3 Potato___healthy":
          return "No action required as the plant is healthy.";
        default:
          return "No management information for this label.";
      }
    } else { // Bahasa Indonesia
      switch (label) {
        case "1 Potato___Early_blight":
          return "Pengendalian termasuk rotasi tanaman, penggunaan varietas tahan, aplikasi fungisida yang tepat, dan sanitasi untuk mengurangi penyebaran spora jamur di tanah dan sisa-sisa tanaman.";
        case "2 Potato___Late_blight":
          return "Deteksi dini dan penggunaan fungisida yang tepat sangat penting untuk mengendalikan infeksi ini, bersama dengan rotasi tanaman, perbaikan drainase tanah, dan sanitasi yang ketat untuk menghilangkan sumber infeksi.";
        case "3 Potato___healthy":
          return "Tidak ada tindakan yang diperlukan karena tanaman dalam kondisi sehat.";
        default:
          return "Tidak ada informasi penanganan untuk label ini.";
      }
    }
  }

  Widget buildBoxDecoration(String title, List<Map<String, dynamic>> contents) {
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 8.0),
          for (var content in contents)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Label: ${content['label']}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Confidence: ${content['confidence'].toStringAsFixed(0)}%",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    getDiseaseDescription(content['label']),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildManagementBoxDecoration(String title, List<Map<String, dynamic>> contents) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.2),
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8.0),
          for (var content in contents)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Label: ${content['label']}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    getDiseaseManagement(content['label']),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
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
        title: Text(language == 'en' ? "Disease Analysis" : "Analisis Penyakit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              buildBoxDecoration(
                language == 'en' ? "Analysis Potato Diseases" : "Analisis Penyakit Kentang",
                recognitions,
              ),
              const SizedBox(height: 12),
              buildManagementBoxDecoration(
                language == 'en' ? "Disease Management" : "Pengelolaan Penyakit",
                recognitions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
