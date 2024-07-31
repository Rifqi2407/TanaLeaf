import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as devtools;

import 'package:skripsi/core/app_routes.dart';

class PlantDetectionPage extends StatefulWidget {
  final String language;

  const PlantDetectionPage({Key? key, required this.language}) : super(key: key);

  @override
  _PlantDetectionPageState createState() => _PlantDetectionPageState();
}

class _PlantDetectionPageState extends State<PlantDetectionPage> {
  File? filePath;
  List<Map<String, dynamic>> recognitions = [];

  Color get primaryColor => const Color(0xffFFBB38);

  Future<void> _tfLiteInit() async {
    try {
      String? res = await Tflite.loadModel(
        model: "assets/mobilenetv2.tflite",
        labels: "assets/label_potato.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
      if (res == null) {
        devtools.log("Failed to load the model");
      }
    } catch (e) {
      devtools.log("Error loading model: $e");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image == null) return;

      var imageMap = File(image.path);

      setState(() {
        filePath = imageMap;
        recognitions = [];
      });

      var recognitionsResult = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 3,  // Mengubah numResults ke 3 untuk mendeteksi semua label
        threshold: 0.2,
        asynch: true,
      );

      if (recognitionsResult == null || recognitionsResult.isEmpty) {
        devtools.log("Recognitions are null or empty");
        return;
      }

      devtools.log(recognitionsResult.toString());
      setState(() {
        recognitions = recognitionsResult.map((res) {
          return {
            "label": res['label'].toString(),
            "confidence": (res['confidence'] * 100),
          };
        }).toList();
      });
    } catch (e) {
      devtools.log("Error picking image or running model: $e");
    }
  }

  void pickImageGallery() => _pickImage(ImageSource.gallery);

  void pickImageCamera() => _pickImage(ImageSource.camera);

  void navigateToAnalysisPage() {
    Navigator.pushNamed(
      context,
      AppRoutes.analysis,
      arguments: {
        'recognitions': recognitions,
        'language': widget.language,
      },
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tfLiteInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.language == 'en' ? "Plant Detection" : "Deteksi Penyakit"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Card(
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        Container(
                          height: 280,
                          width: 280,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 203, 10),
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage('assets/upload.jpg'),
                            ),
                          ),
                          child: filePath == null
                              ? const Text('')
                              : Image.file(
                                  filePath!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: recognitions.map((res) {
                              return Column(
                                children: [
                                  Text(
                                    res['label'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Confidence: ${res['confidence'].toStringAsFixed(0)}%",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: pickImageCamera,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Text(
                  widget.language == 'en' ? "Take a Photo" : "Ambil Foto",
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: pickImageGallery,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Text(
                  widget.language == 'en' ? "Pick from Gallery" : "Pilih dari Galeri",
                ),
              ),
              ElevatedButton(
                onPressed: navigateToAnalysisPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Text(
                  widget.language == 'en' ? "Analysis Diseases" : "Analisis Penyakit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
