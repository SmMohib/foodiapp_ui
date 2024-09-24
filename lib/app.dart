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
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 239, 238),
        appBarTheme: AppBarTheme(backgroundColor: primaryColor),
       colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),debugShowCheckedModeBanner: false,
      home: BtmNevBar(),
    );
  }
}
