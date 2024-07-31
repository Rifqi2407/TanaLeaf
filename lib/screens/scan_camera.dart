import 'package:flutter/material.dart';

class ScanCameraPage extends StatelessWidget {
  final String language; // Tambahkan parameter bahasa

  const ScanCameraPage({Key? key, required this.language}) : super(key: key);

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
        title: Text(_translate("Scan Camera", "Pindai Kamera")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildBoxDecoration(
                _translate("Scan Camera", "Pindai Kamera"),
                language == 'en'
                    ? [
                        "1. Download App : Download and install the app from the mobile app store.",
                        "2. Open App : Open the app after it has finished installing.",
                        "3. Select Camera Scan Mode : Choose the camera scan mode or image recognition mode.",
                        "4. Point Camera : Point the phone camera at the potato plant leaves you want to inspect.",
                        "5. Take Photo or Activate Scan : Take a photo or let the app start scanning automatically.",
                        "6. Wait for Analysis : Wait for the analysis result to identify disease symptoms.",
                        "7. Receive Results : Receive results such as the type of disease and its severity.",
                        "8. Action Recommendations : Receive recommendations for further actions such as fungicide application or plant management."
                      ]
                    : [
                        "1. Unduh Aplikasi : Unduh dan instal aplikasi dari toko aplikasi ponsel.",
                        "2. Buka Aplikasi : Buka aplikasi setelah selesai diinstal.",
                        "3. Pilih Mode Scan Kamera : Pilih mode scan kamera atau pengenalan gambar.",
                        "4. Arahkan Kamera : Arahkan kamera ponsel ke daun tanaman kentang yang ingin diperiksa.",
                        "5. Ambil Foto atau Aktifkan Scan : Ambil foto atau biarkan aplikasi memulai scan secara otomatis.",
                        "6. Tunggu Analisis : Tunggu hasil analisis untuk mengidentifikasi gejala penyakit.",
                        "7. Terima Hasil : Terima hasil berupa jenis penyakit dan tingkat keparahannya.",
                        "8. Rekomendasi Tindakan : Terima rekomendasi untuk tindakan selanjutnya seperti penggunaan fungisida atau manajemen tanaman."
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
