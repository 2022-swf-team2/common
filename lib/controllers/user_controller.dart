import '../models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  //여기서 유저데이터 관리 - 서버로부터 받은 데이터
  static UserController get to => Get.find();

  List<User> _userList = [];
  List<User> get userList => _userList;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _userList = [
      User(
        id: '1',
        phoneNumber: '01037058825',
        name: '윤정훈',
        university: '충남대학교',
        job: '컴퓨터공학',
        imageUrl: 'assets/images/user_1.JPG',
        instaId: '',
        kakaoLinkUrl: '',
        userTagList: ['성실', '열정', '책임감', '개발', '플러터'],
        applyGatheringList: [],
        openGatheringList: [],
        likeGathering: [],
        likeUser: [],
      ),
      User(
        id: '2',
        phoneNumber: '01012345678',
        name: '조현수',
        university: '충남대학교',
        job: '응용화공',
        imageUrl: 'assets/images/user_2.png',
        instaId: '',
        kakaoLinkUrl: '',
        userTagList: ['창업', '성장', '기획', '디자인', '영업'],
        applyGatheringList: [],
        openGatheringList: [],
        likeGathering: [],
        likeUser: [],
      ),
      User(
        id: '3',
        phoneNumber: '01012345678',
        name: '채승규',
        university: '충남대학교',
        job: '컴퓨터공학',
        imageUrl: 'assets/images/user_3.png',
        instaId: '',
        kakaoLinkUrl: '',
        userTagList: ['성실', '열정', '책임감', '개발', '자바스크립트'],
        applyGatheringList: [],
        openGatheringList: [],
        likeGathering: [],
        likeUser: [],
      ),
      User(
        id: '4',
        phoneNumber: '01037058825',
        name: '이시형',
        university: '충남대학교',
        job: '컴퓨터공학',
        imageUrl: 'assets/images/user_4.png',
        instaId: '',
        kakaoLinkUrl: '',
        userTagList: ['성실', '열정', '책임감', '개발', '자바'],
        applyGatheringList: [],
        openGatheringList: [],
        likeGathering: [],
        likeUser: [],
      ),
    ];
  }
}
