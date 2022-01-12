import 'package:common/controllers/database_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/models/applicant.dart';
import 'package:common/models/user.dart';
import '../models/gathering.dart';
import '../models/host.dart';
import 'package:get/get.dart';

class GatheringController extends GetxController {

  final DatabaseController _databaseController = DatabaseController.to;
  static GatheringController get to => Get.find();

  List<Gathering> _gatheringList = [];
  List<Gathering> get gatheringList => _gatheringList;

  List<Gathering> _categoryGatheringList = [];
  List<Gathering> get categoryGatheringList => _categoryGatheringList;

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
        over: false,
        title: 'Flutter 공부할사람 구해요!!',
        category: '스터디',
        participant: 3,
        capacity: 5,
        openTime: '2022-01-18 18:00',
        endTime: '2022-01-18 20:00',
        location: '대전 유성구 대학로99',
        locationDetail: '충남대 공대 5호관 415호',
        hostMessage: 'ESFJ인 사람이랑 코딩하자!! MBTI 같으면 시너지가 늘어납니다~~ 나이 성별 무관 상관없어요~~',
        tagList: ['20대', '30대', '학과무관', '아무나', '다와라'],
        previousImageList: [],
        applyList:[],
        approvalList: [],
        cancelList: [],
      ),
      Gathering(
        id: '2',
        host: Host(
          userId: '2',
          name: '조현수',
          imageUrl: 'assets/images/user_2.png',
          job: '응용화공',
          userTagList: ['창업', '성장', '기획', '디자인', '영업'],
        ),
        over: false,
        title: '디자인스프린트 끝나고 뒤풀이가자!!',
        category: '음주',
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
        applyList: [],
        approvalList: [],
        cancelList: [],
      ),
      Gathering(
        id: '3',
        host: Host(
          userId: '3',
          name: '채승규',
          imageUrl: 'assets/images/user_3.png',
          job: '컴퓨터공학',
          userTagList: ['성실', '열정', '책임감', '개발', '자바스크립트'],
        ),
        over: false,
        title: '저랑 술배틀 뜨실분 구합니다!!',
        category: '음주',
        participant: 1,
        capacity: 3,
        openTime: '2022-01-19 20:00',
        endTime: '',
        location: '대전 유성구 궁동 409',
        locationDetail: '궁동 달빛포차',
        hostMessage: '디자인스프린트 끝!!이제 술함 조져볼까요??',
        tagList: ['교수님', '서포터즈', '수강생들', '고생했어요', '이젠 술마셔요', '달빛포차에서'],
        previousImageList: [],
        applyList: [],
        approvalList: [],
        cancelList: [],
      ),
      Gathering(
        id: '4',
        host: Host(
          userId: '4',
          name: '이시형',
          imageUrl: 'assets/images/user_4.png',
          job: '컴퓨터공학',
          userTagList: ['성실', '열정', '책임감', '개발', '자바'],
        ),
        over: false,
        title: '음주코딩!!마시면서 하자!!',
        category: '음주',
        participant: 2,
        capacity: 10,
        openTime: '2022-01-16 20:00',
        endTime: '2022-01-16 22:00',
        location: '대전 유성구 궁동 409-6',
        locationDetail: '궁동 역전할머니맥주',
        hostMessage: '디자인스프린트 끝나도 술마시며 코딩연습해요!!',
        tagList: ['교수님', '서포터즈', '수강생들', '고생했어요','공부는 끝이없다','음주','코딩','둘다하자'],
        previousImageList: ['assets/images/exercise_1.jpeg'],
        applyList: [],
        approvalList: [],
        cancelList: [],
      ),
    ];
  }

  Future<void> setCategoryGatheringList(String category) async {
    //여기서 데이터 가져온후 세팅완료되면 그때 다음페이지로 넘어가주기
    _categoryGatheringList = [];
    for(Gathering gathering in _gatheringList){
      if(gathering.category == category){
        _categoryGatheringList.add(gathering);
      }
    }
    update();
  }

  Future<void> updateList() async{
    _databaseController.getGatheringDocs();
    _databaseController.getUserDocs();
  }
}
