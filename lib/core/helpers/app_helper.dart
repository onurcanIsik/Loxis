import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loxis/core/managers/shared.manager.dart';

class AppHelper {
  static Future<void> initializeFirebaseApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 1. .env DOSYASINI YÜKLE
    await dotenv.load(fileName: ".env");

    // 2. LOCALIZATION BAŞLAT
    await EasyLocalization.ensureInitialized();

    // 3. SHARED PREFS
    await SharedPrefsManager.init();

    // 4. FIREBASE BAŞLAT
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY']!,
        appId: dotenv.env['FIREBASE_APP_ID_ANDROID']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
      ),
    );
  }
}
