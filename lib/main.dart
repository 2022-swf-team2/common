import 'package:common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/main/main_screen.dart';
import 'screens/start/start_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWF team2',
      theme: ThemeData(
        primaryColor: kGreyColor,
        focusColor: kGreyColor,
      ),
      home: const MainScreen(),
    );
  }
}