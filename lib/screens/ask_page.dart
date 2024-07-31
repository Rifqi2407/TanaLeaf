import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AskPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const AskPage({Key? key, required this.language}) : super(key: key);

  Color get primaryColor => const Color(0xffFFBB38);

  Future openUrl(Uri uri) async {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  // Fungsi untuk menerjemahkan teks berdasarkan bahasa
  String _translate(String en, String id) {
    return language == 'en' ? en : id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_translate("Ask Expert", "Tanya Ahli")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContactItem(
              context,
              _translate("Semarang City Government Agriculture Service", "Dinas Pertanian Pemerintah Kota Semarang"),
              Uri.parse("https://wa.me/6281325373232"), 
              Uri.parse("mailto:pertanian@semarangkota.go.id"),
              Uri.parse("tel:081325373232"),
              "assets/images/Dinas_Pemkot_Smg.png", 
            ),
            _buildContactItem(
              context,
              _translate("Central Java Agriculture and Plantation Service", "Dinas Pertanian dan Perkebunan Jawa Tengah"),
              Uri.parse("https://wa.me/6224921010"), 
              Uri.parse("mailto:distanbun@jatengprov.go.id"),
              Uri.parse("tel:024921010"),
              "assets/images/Dinas_Pertanian_Jateng.png", 
            ),
            _buildContactItem(
              context,
              _translate("Ministry of Agriculture of the Republic of Indonesia", "Kementerian Pertanian Republik Indonesia"),
              Uri.parse("https://wa.me/6285179657867"), 
              Uri.parse("mailto:layanan-ip@pertanian.go.id"),
              Uri.parse("tel:085179657867"),
              "assets/images/Kementan_RI.png", 
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String title,
    Uri whatsappUrl,
    Uri emailUrl,
    Uri phoneUrl,
    String imagePath, 
  ) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.message),
                  title: Text(_translate('WhatsApp', 'WhatsApp')),
                  onTap: () => openUrl(whatsappUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(_translate('Email', 'Email')),
                  onTap: () => openUrl(emailUrl),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(_translate('Telephone', 'Telepon')),
                  onTap: () => openUrl(phoneUrl),
                ),
              ],
            );
          },
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
