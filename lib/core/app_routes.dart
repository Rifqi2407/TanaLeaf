import 'package:flutter/material.dart';
import 'package:skripsi/screens/about_page.dart';
import 'package:skripsi/screens/ask_page.dart';
import 'package:skripsi/screens/home_page.dart';
import 'package:skripsi/screens/onboarding_screen.dart/onboarding_screen.dart';
import 'package:skripsi/screens/splash/splash_screen.dart';
import 'package:skripsi/screens/plan_detection_page.dart';
import 'package:skripsi/screens/deases_manage_page.dart';
import 'package:skripsi/screens/deases_plan_page.dart';
import 'package:skripsi/screens/how_page.dart';
import 'package:skripsi/screens/normal_page.dart';
import 'package:skripsi/screens/early_page.dart';
import 'package:skripsi/screens/late.dart';
import 'package:skripsi/screens/scan_camera.dart';
import 'package:skripsi/screens/scan_galery.dart';
import 'package:skripsi/screens/manage_normal_page.dart';
import 'package:skripsi/screens/manage_early_page.dart';
import 'package:skripsi/screens/manage_late_page.dart';
import 'package:skripsi/screens/analysis_page.dart';

class AppRoutes {
  // Define all route names
  static const String splash = "/";
  static const String onboard = "/onboard";
  static const String home = "/home";
  static const String plantdetection = "/plantdetection";
  static const String deasesmanage = "/deasesmanage";
  static const String deasesplan = "/deasesplan";
  static const String how = "/how";
  static const String ask = "/ask";
  static const String about = "/about";
  static const String normal = "/normal";
  static const String early = "/early";
  static const String late = "/late";
  static const String scancamera = "/scancamera";
  static const String scangalery = "/scangalery";
  static const String managenormal = "/managenormal";
  static const String manageearly = "/manageearly";
  static const String managelate = "/managelate";
  static const String analysis = "/analysis";

  // Generate routes based on settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Get parameters from settings.arguments
    final Map<String, dynamic> args = settings.arguments is Map<String, dynamic>
        ? settings.arguments as Map<String, dynamic>
        : {};

    final String language = args['language'] ?? 'en';

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case onboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingScreen(),
        );

      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MyHomePage(),
        );

      case plantdetection:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => PlantDetectionPage(language: language),
        );

      case deasesmanage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DeasesManagePage(language: language),
        );

      case deasesplan:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DeasesPlanPage(language: language),
        );

      case how:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HowPage(language: language),
        );

      case ask:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AskPage(language: language),
        );

      case about:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AboutPage(language: language),
        );

      case normal:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => NormalPage(language: language),
        );

      case early:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EarlyPage(language: language),
        );

      case late:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LatePage(language: language),
        );

      case scancamera:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ScanCameraPage(language: language),
        );

      case scangalery:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ScanGaleryPage(language: language),
        );

      case managenormal:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ManageNormalPage(language: language),
        );

      case manageearly:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ManageEarlyPage(language: language),
        );

      case managelate:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ManageLatePage(language: language),
        );

      case analysis:
        final recognitions = args['recognitions'] as List<Map<String, dynamic>>? ?? [];
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AnalysisPage(recognitions: recognitions, language: language),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
