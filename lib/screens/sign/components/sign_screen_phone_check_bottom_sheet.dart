import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignScreenPhoneCheckBottomSheet extends StatelessWidget {
  final bool phoneNumberChecked;
  const SignScreenPhoneCheckBottomSheet({Key? key, required this.phoneNumberChecked,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          print('haha');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 50,
          decoration:
          BoxDecoration(color: phoneNumberChecked ? kBlueColor : kGreyColor),
          child: const Text(
            '다음',
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
