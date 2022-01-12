import 'package:common/constants.dart';
import 'package:common/controllers/database_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/main/main_screen.dart';
import 'screens/start/start_screen.dart';
import 'screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseController _controller = Get.put(DatabaseController());
    _controller.getUser('123');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWF team2',
      theme: ThemeData(
        primaryColor: kGreyColor,
        focusColor: kGreyColor,
      ),
      home: const StartScreen(),
    );
  }
}