import '../models/user.dart';
import 'package:get/get.dart';

import 'database_controller.dart';

class UserController extends GetxController {
  //여기서 유저데이터 관리 - 서버로부터 받은 데이터
  static UserController get to => Get.find();

  List<User> _userList = [];
  List<User> get userList => _userList;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setUserList();
  }

  Future<void> setUserList()async{
    _userList = (await DatabaseController.to.getUserDocs())??[];
  }

  Future<void> setUserUniversity(String newUniversity)async{
    Map<String,dynamic> _body = {
      'university':newUniversity
    };
    await DatabaseController.to.updateUser(_body);
  }
  Future<void> setUserName(String newName)async{
    Map<String,dynamic> _body = {
     'name':newName
    };
    await DatabaseController.to.updateUser(_body);
  }
  Future<void> setUserJob(String newJob)async{
    Map<String,dynamic> _body = {
      'job':newJob
    };
    await DatabaseController.to.updateUser(_body);
  }
  Future<void> setUserTagList(List newTagList)async{
    Map<String,dynamic> _body = {
      'userTagList':newTagList
    };
    await DatabaseController.to.updateUser(_body);
  }
  Future<void> setUserPhoneNumber(String newPhoneNumber)async{
    Map<String,dynamic> _body = {
      'phoneNumber':newPhoneNumber
    };
    await DatabaseController.to.updateUser(_body);
  }
  Future<void> setUserInstaId(String newInstaId)async{
    Map<String,dynamic> _body = {
      'instaId':newInstaId
    };
    await DatabaseController.to.updateUser(_body);
  }
  Future<void> setUserKakaoLinkUrl(String newKakaoLinkUrl)async{
    Map<String,dynamic> _body = {
      'kakaoLinkUrl':newKakaoLinkUrl
    };
    await DatabaseController.to.updateUser(_body);
  }
}
