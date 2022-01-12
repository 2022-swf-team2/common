import 'package:common/models/gathering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/user_screen_content_card.dart';
import 'components/user_screen_content_title.dart';
import 'components/user_screen_gathering_screen.dart';
import '../profile/profile_screen.dart';
import '../../constants.dart';
import '../../controllers/user_controller.dart';
import '../../models/user.dart';

class UserScreen extends StatelessWidget {
  final User user;
  UserScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserController _controller = UserController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('my'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserScreenContentTitle(title: '내정보'),
              UserScreenContentCard(
                  text: '프로필 보기',
                  onPressed: () {
                    Get.to(() => ProfileScreen(
                          currentUserId: '1',
                          user: _controller.userList[0],
                          //TODO 팔로잉된 유저인가
                          isFollowed: false,
                        ));
                  }),
              const UserScreenContentTitle(title: '모임 정보'),
              UserScreenContentCard(
                  text: '호스트로 주최한 모임',
                  onPressed: () {
                    Get.to(
                      () => UserScreenGatheringScreen(
                        title: '호스트로 주최한 모임',
                        gatheringList: user.openGatheringList.map((element) {
                          return Gathering.fromJson(element);
                        }).toList(),
                      ),
                    );
                  }),
              UserScreenContentCard(
                  text: '게스트로 참여한 모임',
                  onPressed: () {
                    Get.to(
                      () => UserScreenGatheringScreen(
                          title: '게스트로 참여한 모임',
                          gatheringList: user.applyGatheringList.map((element) {
                            return Gathering.fromJson(element);
                          }).toList()),
                    );
                  }),
              UserScreenContentCard(text: '참여한 모임 사진', onPressed: () {}),
              const UserScreenContentTitle(title: '어플정보'),
              UserScreenContentCard(text: '공지사항', onPressed: () {}),
              UserScreenContentCard(text: '1:1 문의', onPressed: () {}),
              UserScreenContentCard(text: '이용약관', onPressed: () {}),
              UserScreenContentCard(text: '친구 초대하기', onPressed: () {}),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '버전 1.0.0',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
