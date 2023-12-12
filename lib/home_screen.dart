import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_change_test/app_constants.dart';
import 'package:language_change_test/controller/language_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        centerTitle: true,
      ),
      body: SafeArea(child: Center(
        child: GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('welcome'),
              Text('cart'),
              Text('select'),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  localizationController.setLanguage(Locale(
                    AppConstants.languages[0].languageCode,
                    AppConstants.languages[0].countryCode,
                  ));
                  localizationController.setSelectedIndex(0 );
                  _saveLanguage('en');
                  setState(() {});
                },
                child: Text('English'),
              ),
              ElevatedButton(
                onPressed: () {
                  localizationController.setLanguage(Locale(
                    AppConstants.languages[1].languageCode,
                    AppConstants.languages[1].countryCode,
                  ));
                  localizationController.setSelectedIndex(1);
                  _saveLanguage('ar');
                  setState(() {});
                },
                child: Text('Arabic'),
              ),
              ElevatedButton(
                onPressed: () {
                  localizationController.setLanguage(Locale(
                    AppConstants.languages[2].languageCode,
                    AppConstants.languages[2].countryCode,
                  ));
                  localizationController.setSelectedIndex(2);
                  _saveLanguage('tr');
                  setState(() {});
                },
                child: Text('Turkey'),
              ),
            ],
          );
        }),
      )),
    );
  }
}
