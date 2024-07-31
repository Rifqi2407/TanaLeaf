import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skripsi/screens/about_page.dart';
import 'package:skripsi/screens/plan_detection_page.dart';
import 'package:skripsi/screens/deases_manage_page.dart';
import 'package:skripsi/screens/deases_plan_page.dart';
import 'package:skripsi/screens/how_page.dart';
import 'package:skripsi/screens/ask_page.dart';

class GridDashboard extends StatelessWidget {
  final String searchQuery;
  final String selectedLanguage; // Parameter untuk bahasa yang dipilih

  GridDashboard({required this.searchQuery, required this.selectedLanguage}); // Menyimpan parameter bahasa

  // Menerjemahkan item menu
  final Map<String, Map<String, String>> _localizedItems = {
    'en': {
      'plant_detection': 'Plant Detection',
      'plant_detection_subtitle': 'Detect plants easily',
      'deases_manage': 'Deases Manage',
      'deases_manage_subtitle': 'Handing',
      'deases_plant': 'Deases Plant',
      'deases_plant_subtitle': 'Identify plant diseases',
      'how_to_use': 'How To Use',
      'how_to_use_subtitle': 'User guide and tips',
      'ask_expert': 'Ask Expert',
      'ask_expert_subtitle': 'Get expert advice',
      'about_app': 'About App',
      'about_app_subtitle': 'Information application',
    },
    'id': {
      'plant_detection': 'Deteksi Penyakit',
      'plant_detection_subtitle': 'Deteksi penyakit cepat',
      'deases_manage': 'Penanganan',
      'deases_manage_subtitle': 'Penanganan penyakit',
      'deases_plant': 'Penyakit Tanaman',
      'deases_plant_subtitle': 'Identifikasi penyakit',
      'how_to_use': 'Cara Penggunaan',
      'how_to_use_subtitle': 'Panduan penggunaan',
      'ask_expert': 'Tanya Ahli',
      'ask_expert_subtitle': 'Dapatkan saran dari ahli',
      'about_app': 'Tentang Aplikasi',
      'about_app_subtitle': 'Informasi aplikasi',
    }
  };

  @override
  Widget build(BuildContext context) {
    // Buat item menggunakan terjemahan yang sesuai
    final Items item1 = Items(
      title: _localizedItems[selectedLanguage]!['plant_detection']!,
      subtitle: _localizedItems[selectedLanguage]!['plant_detection_subtitle']!,
      event: "",
      img: "assets/images/Icon_scanf.png",
    );

    final Items item2 = Items(
      title: _localizedItems[selectedLanguage]!['deases_manage']!,
      subtitle: _localizedItems[selectedLanguage]!['deases_manage_subtitle']!,
      event: "",
      img: "assets/images/medical_icon.png",
    );
    
    final Items item3 = Items(
      title: _localizedItems[selectedLanguage]!['deases_plant']!,
      subtitle: _localizedItems[selectedLanguage]!['deases_plant_subtitle']!,
      event: "",
      img: "assets/images/Plant_Deases.png",
    );
    
    final Items item4 = Items(
      title: _localizedItems[selectedLanguage]!['how_to_use']!,
      subtitle: _localizedItems[selectedLanguage]!['how_to_use_subtitle']!,
      event: "",
      img: "assets/images/user-guide.png",
    );
    
    final Items item5 = Items(
      title: _localizedItems[selectedLanguage]!['ask_expert']!,
      subtitle: _localizedItems[selectedLanguage]!['ask_expert_subtitle']!,
      event: "",
      img: "assets/images/ask-the-expert.png",
    );
    
    final Items item6 = Items(
      title: _localizedItems[selectedLanguage]!['about_app']!,
      subtitle: _localizedItems[selectedLanguage]!['about_app_subtitle']!,
      event: "",
      img: "assets/images/information.png",
    );

    List<Items> myList = [item1, item2, item3, item4, item5, item6];

    // Filter items berdasarkan searchQuery
    List<Items> filteredList = myList.where((item) {
      return item.title.toLowerCase().contains(searchQuery) ||
          item.subtitle.toLowerCase().contains(searchQuery);
    }).toList();

    const int color = 0xffFFBB38;
    return GridView.count(
      childAspectRatio: 1.0,
      padding: const EdgeInsets.only(left: 16, right: 16),
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      children: filteredList.map((data) {
        return GestureDetector(
          onTap: () {
            if (data.title == _localizedItems[selectedLanguage]!['plant_detection']) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PlantDetectionPage(language: selectedLanguage)));
            }
            if (data.title == _localizedItems[selectedLanguage]!['deases_manage']) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DeasesManagePage(language: selectedLanguage)));
            }
            if (data.title == _localizedItems[selectedLanguage]!['deases_plant']) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DeasesPlanPage(language: selectedLanguage)));
            }
            if (data.title == _localizedItems[selectedLanguage]!['how_to_use']) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HowPage(language: selectedLanguage)));
            }
            if (data.title == _localizedItems[selectedLanguage]!['ask_expert']) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AskPage(language: selectedLanguage)));
            }
            if (data.title == _localizedItems[selectedLanguage]!['about_app']) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(language: selectedLanguage)));
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color(color), borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  data.img,
                  width: 42,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  data.title,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  data.subtitle,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  data.event,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Items {
  final String title;
  final String subtitle;
  final String event;
  final String img;

  Items({
    required this.title,
    required this.subtitle,
    required this.event,
    required this.img,
  });
}
