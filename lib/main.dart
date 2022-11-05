import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/route/app_pages.dart';
import 'app/route/app_routes.dart';
import 'app/views/splash/splash_page_binding.dart';
import 'firebase_options.dart';
import 'theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.PAGES,
      theme: AppThemes.lightTheme,
      initialRoute: AppRoutes.SPLASH,
      initialBinding: SplashPageBinding(),
      title: "Case",
      locale: const Locale('tr', 'TR'),
    );
  }
}
