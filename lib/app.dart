import 'package:flutter/material.dart';
import 'package:foodiapp_ui/component/color.dart';
import 'package:foodiapp_ui/screens/homeScreen.dart';
import 'package:foodiapp_ui/widget/bottomNev.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foodi App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: primaryColor),
        colorScheme: ColorScheme.fromSeed(seedColor: secondaryColor),
        useMaterial3: true,
      ),
      home: BottomNev(),
    );
  }
}
