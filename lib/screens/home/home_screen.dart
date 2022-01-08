import 'package:common/constants.dart';
import 'package:common/screens/home/components/home_screen_category_area.dart';
import 'package:common/screens/home/components/home_screen_gathering_card.dart';
import 'package:flutter/material.dart';

import 'components/home_screen_advertise_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeScreenAdvertiseArea(),
          const HomeScreenCategoryArea(),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '최근 올라온 모임을 소개해드릴게요!!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                HomeScreenGatheringCard(
                  userName: '윤정훈',
                  userImageUrl: 'assets/images/user_1.JPG',
                  userMajor: '컴퓨터공학',
                  userGrade: '3학년',
                  gatheringTitle: 'Flutter 공부할사람 구해요!!',
                  gatheringDate: '2022.01.14(금)',
                  gatheringTime: '18:00~20:00 / 2시간',
                  gatheringPlace: '충남대 공대 5호관 415호',
                  gatheringTagList: ['성실','열정','책임감','스터디','플러터'],
                ),
                HomeScreenGatheringCard(
                  userName: '조현수',
                  userImageUrl: 'assets/images/user_2.png',
                  userMajor: '응용화공',
                  userGrade: '3학년',
                  gatheringTitle: '디자인스프린트 끝나고 뒤풀이가자!!',
                  gatheringDate: '2022.01.14(금)',
                  gatheringTime: '18:00~20:00 / 2시간',
                  gatheringPlace: '궁동 한마음정육식당',
                  gatheringTagList: ['교수님','서포터즈','수강생들','고생하셨어요'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowCheck extends StatelessWidget {
  const RowCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}

