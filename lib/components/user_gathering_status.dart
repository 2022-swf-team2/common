import 'package:flutter/material.dart';

import '../constants.dart';

class UserGatheringStatus extends StatelessWidget {
  const UserGatheringStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: kGreyColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            Icon(
              Icons.assignment,
              color: kWhiteColor,
            ),
            Text(
              '모임 신청 승인을 기다리고있습니다.',
              style: TextStyle(
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
