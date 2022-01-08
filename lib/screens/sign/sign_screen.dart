import 'package:common/constants.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:common/screens/sign/components/sign_screen_app_bar.dart';
import 'package:common/screens/sign/components/sign_screen_name_check_area.dart';
import 'package:common/screens/sign/components/sign_screen_name_check_bottom_sheet.dart';
import 'package:common/screens/sign/components/sign_screen_phone_check_area.dart';
import 'package:common/screens/sign/components/sign_screen_phone_check_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);
  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  int _currentIndex = 0;
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  bool _isPhoneNumberEnabled = false;
  bool _phoneNumberChecked = false;

  bool _isNameEnabled = false; // 2~6자인지 체크
  bool _nameChecked = false; // 중복확인 했는지 체크
  bool _isNameDuplicated = false;

  final List<String> _enablePhoneNumber = [
    '010',
    '011',
    '016',
    '017',
    '018',
    '019'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SignScreenAppBar(
        currentIndex: _currentIndex,
        backPressed: () {
          if (_currentIndex == 0) {
            Get.back();
          } else if (_currentIndex == 1) {
            setState(() {
              _currentIndex = 0;
            });
          }
        },
      ),
      body: _currentIndex == 0
          ? SignScreenPhoneCheckArea(
              enablePhoneNumber: _isPhoneNumberEnabled,
              phoneNumberChecked: _phoneNumberChecked,
              checkPhoneNumber: (bool check) {
                setState(() {
                  _isPhoneNumberEnabled = check;
                });
              },
              checkButtonPressed: () {
                setState(() {
                  _phoneNumberChecked = true;
                });
              },
              controller: _phoneNumberEditingController,
            )
          : SignScreenNameCheckArea(
              controller: _nameEditingController,
              enabledName: _isNameEnabled,
              nameChecked: _nameChecked,
              nameDuplicated: _isNameDuplicated,
              checkEnabledName: (bool check) {
                setState(() {
                  _isNameEnabled = check;
                });
              },
              checkButtonPressed: () {
                setState(() {
                  if (_nameEditingController.text == 'hahaha') {
                    _isNameDuplicated = true;
                  } else {
                    _nameChecked = true;
                  }
                });
              },
            ),
      bottomSheet: _currentIndex == 0
          ? SignScreenPhoneCheckBottomSheet(
              phoneNumberChecked: _phoneNumberChecked,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            )
          : SignScreenNameCheckBottomSheet(
              nameChecked: _nameChecked,
              onPressed: () {
                Get.to(() => const MainScreen());
              }),
    );
  }
}
