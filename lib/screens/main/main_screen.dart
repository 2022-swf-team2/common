import 'package:common/constants.dart';
import 'package:common/controllers/local_controller.dart';
import 'package:common/screens/main/components/main_screen_advertise_area.dart';
import 'package:common/screens/university/university_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final LocalController _localController = Get.put(LocalController());
  String _userUniversity = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserUniversity();
  }

  void getUserUniversity() async {
    _userUniversity = await (_localController.getUniversity()) ?? '충남대학교';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: GestureDetector(
          onTap: () {
            Get.to(() => const UniversityScreen());
          },
          child: Row(
            children: [
              Text(_userUniversity),
              const SizedBox(width: 5),
              const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          MainScreenAdvertiseArea(),
        ],
      ),
    );
  }
}
