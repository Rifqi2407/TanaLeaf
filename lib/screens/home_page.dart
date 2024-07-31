import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFFBB38)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  String _selectedLanguage = 'id'; // Default language
  final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'dashboard': 'Dashboard',
      'app_name': 'TanaLeaf',
      'search_hint': 'Search For Menu',
    },
    'id': {
      'dashboard': 'Menu Utama',
      'app_name': 'TanaLeaf',
      'search_hint': 'Cari Menu',
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 250, 252),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(height: 40), // Adjusted space for the dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _localizedStrings[_selectedLanguage]!['dashboard']!,
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 14, 13, 13),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _localizedStrings[_selectedLanguage]!['app_name']!,
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 14, 13, 13),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/TanaLeaf_Logo.png', // Ganti dengan path logo Anda
                          width: 65,
                          height: 65,
                        ),
                        const SizedBox(width: 8), // Adjusted space between logo and dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFBB38),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedLanguage,
                              items: [
                                DropdownMenuItem(
                                  value: 'en',
                                  child: Text('EN'),
                                ),
                                DropdownMenuItem(
                                  value: 'id',
                                  child: Text('IN'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedLanguage = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    hintText: _localizedStrings[_selectedLanguage]!['search_hint']!,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridDashboard(
                  searchQuery: searchQuery,
                  selectedLanguage: _selectedLanguage,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
