import 'package:common/models/gathering.dart';
import 'package:common/models/host.dart';
import 'package:common/models/user.dart';
import 'package:get/get.dart';

class GatheringController extends GetxController {
  static GatheringController get to => Get.find();

  List<Gathering> _gatheringList = [];
  List<Gathering> get gatheringList => _gatheringList;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _gatheringList = [
      Gathering(
        id: '1',
        host: Host(
          userId: '1',
          name: '윤정훈',
          imageUrl: 'assets/images/user_1.JPG',
          job: '컴퓨터공학',
          userTagList: ['성실', '열정', '책임감', '개발', '플러터'],
        ),
        title: 'Flutter 공부할사람 구해요!!',
        category: '스터디>코딩',
        participant: 3,
        capacity: 5,
        openTime: '2022-01-14 18:00',
        endTime: '2022-01-14 20:00',
        location: '대전 유성구 대학로99',
        locationDetail: '충남대 공대 5호관 415호',
        hostMessage: 'ESFJ인 사람이랑 코딩하자!! MBTI 같으면 시너지가 늘어납니다~~ 나이 성별 무관 상관없어요~~',
        tagList: ['20대', '30대', '학과무관', '아무나', '다와라'],
        previousImageList: [],
      ),
      Gathering(
        id: '2',
        host: Host(
            userId: '2',
            name: '조현수',
            imageUrl: 'assets/images/user_2.png',
            job: '응용화공',
            userTagList: ['창업', '성장', '기획', '디자인', '영업']),
        title: '디자인스프린트 끝나고 뒤풀이가자!!',
        category: '음주>소주',
        participant: 40,
        capacity: 55,
        openTime: '2022-01-14 18:00',
        endTime: '2022-01-15 01:00',
        location: '대전 유성구 궁동 100-1',
        locationDetail: '궁동 한마음정육식당',
        hostMessage:
            '디자인스프린트 끝!! 이것도 인연인데 고기 먹으러 뒤풀이하러가요!!!많관부해주세요~~고기 싫어하는 사람 없겠죠??',
        tagList: [
          '교수님',
          '서포터즈',
          '수강생들',
          '고생했어요',
          '궁동',
          '한마음정육식당',
          '고기먹으러',
          '가자',
          '20대',
          '아무나'
        ],
        previousImageList: [],
      ),
    ];
  }
}
