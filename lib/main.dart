import 'package:flutter/material.dart';
import 'package:tibetan_prayer/pages/prayer_home_page.dart';
import 'package:tibetan_prayer/util/application_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'jomolhari',
        primarySwatch: ApplicationUtil.createMaterialColor(
          const Color(0xff704c04),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const PrayerHomePage(),
    );
  }
}
