import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main/main_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){
      Get.off(()=>const MainScreen());
    });
    return const Scaffold(
      body: Center(
        child: Text('스플래시화면'),
      ),
    );
  }
}
