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
    setGatheringList();
  }

  Future<void> setGatheringList()async{
    _gatheringList = (await DatabaseController.to.getGatheringDocs())??[];
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
