import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignScreenPhoneCheckArea extends StatelessWidget {
  final String phoneNumberString;
  final bool enablePhoneNumber;
  final bool enablePhoneNumberChecked;
  final bool phoneNumberChoosed;
  final Function checkPhoneNumber;
  final Function checkButtonPressed;
  final TextEditingController controller;
  const SignScreenPhoneCheckArea({
    Key? key,
    required this.phoneNumberString,
    required this.enablePhoneNumber,
    required this.enablePhoneNumberChecked,
    required this.phoneNumberChoosed,
    required this.checkPhoneNumber,
    required this.checkButtonPressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('휴대폰번호를 입력해주세요'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (String s) {
                        if(s.length>11){
                          controller.text = s.substring(0,11);
                        }
                        if (s.length == 10 ||
                            s.length == 11 &&
                                phoneNumberString.contains(s.substring(0, 3))) {
                          checkPhoneNumber(true);
                        } else {
                          if (enablePhoneNumber) {
                            checkPhoneNumber(false);
                          }
                        }
                      },
                      controller: controller,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                    ),
                    !enablePhoneNumber
                        ? const Text('휴대폰 번호가 올바르지 않습니다')
                        : const Text(''),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (enablePhoneNumber) {
                  checkButtonPressed();
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: enablePhoneNumber
                      ? phoneNumberChoosed
                          ? kGreyColor
                          : kBlueColor
                      : kGreyColor,
                ),
                width: 80,
                height: 40,
                child: Text(
                  phoneNumberChoosed ? '확인완료' : '확인',
                  style: const TextStyle(
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
