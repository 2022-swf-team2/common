import 'package:common/constants.dart';
import 'package:common/screens/sign/components/sign_screen_app_bar.dart';
import 'package:common/screens/sign/components/sign_screen_phone_check_area.dart';
import 'package:common/screens/sign/components/sign_screen_phone_check_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);
  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final TextEditingController _phoneNumberEditingController =
      TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();

  bool _isPhoneNumberEnabled = false;
  bool _phoneNumberEnableChecked = false;
  bool _phoneNumberChecked = false;

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
      appBar: const SignScreenAppBar(),
      body: SignScreenPhoneCheckArea(
        phoneNumberString: _phoneNumberEditingController.text,
        enablePhoneNumber: _isPhoneNumberEnabled,
        enablePhoneNumberChecked: _phoneNumberEnableChecked,
        phoneNumberChoosed: _phoneNumberChecked,
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
      ),
      bottomSheet: SignScreenPhoneCheckBottomSheet(
        phoneNumberChecked: _phoneNumberChecked,
      ),
    );
  }
}
