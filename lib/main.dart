import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_change_test/app_constants.dart';
import 'package:language_change_test/controller/language_controller.dart';
import 'package:language_change_test/home_screen.dart';
import 'package:language_change_test/messages.dart';
import 'dependency_inj.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await dep.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});

  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Language Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          locale: localizationController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(
            AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
