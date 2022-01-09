import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailScreenBottomBar extends StatelessWidget {
  final Function chatPressed;
  final Function applyPressed;
  const DetailScreenBottomBar({
    Key? key,
    required this.chatPressed,
    required this.applyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        top: 10,
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                chatPressed();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    color: kPinkColor, borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  '채팅하기',
                  style: TextStyle(
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                applyPressed();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    color: kBlueColor, borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  '신청하기',
                  style: TextStyle(
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
