import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/models/gathering.dart';
import 'package:common/models/user.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  static DatabaseController get to => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user;

  Future<void> getUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await (_firestore.collection('user').doc(id).get());

    Map<String, dynamic> json = _dbUser.data()!;
    User userData = User.fromJson({
      'id': _dbUser.id,
      ...json,
    });
    user = userData;
    return ;
  }

  Future<bool> checkPhoneNumberIsDuplicated(String phoneNumber) async {
    QuerySnapshot _dbPhoneList = await (_firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get());
    List _getPhoneList = _dbPhoneList.docs.toList();
    return _getPhoneList.isEmpty;
  }

  Future<bool> checkNameIsDuplicated(String name) async {
    QuerySnapshot _dbNameList = await (_firestore
        .collection('user')
        .where('name', isEqualTo: name)
        .get());
    List _getNameList = _dbNameList.docs.toList();
    return _getNameList.isEmpty;
  }

  Future<String> makeUser(Map<String, dynamic> body) async {
    String? id;
    await _firestore.collection('user').add(body).then((value) {
      id = value.id;
      user = User.fromJson({
        'id': value.id,
        ...body,
      });
      update();
    });
    return id!;
  }

  Future<void> makeGathering(Map<String, dynamic> body) async {
    await _firestore.collection('gathering').add(body);
  }

  Future<List<User>?> getUserDocs() async {
    QuerySnapshot userData = await _firestore.collection('user').get();
    List<User> userList = [];
    List userDocs = userData.docs;
    for(int i = 0; i < userDocs.length;i++){
      Map<String, dynamic> body = {
        'id': userDocs[i].id,
        ...userDocs[i].data() as Map<String, dynamic>
      };
      userList.add(User.fromJson(body));
    }
    return userList;
  }

  Future<List<Gathering>?> getGatheringDocs() async {
    QuerySnapshot gatheringData = await _firestore.collection('gathering').get();
    List<Gathering> gatheringList = [];
    List gatheringDocs = gatheringData.docs;
    for(int i = 0; i < gatheringDocs.length;i++){
      Map<String, dynamic> body = {
        'id': gatheringDocs[i].id,
        ...gatheringDocs[i].data() as Map<String, dynamic>
      };
      gatheringList.add(Gathering.fromJson(body));
    }
    return gatheringList;
  }

  Future<void> updateUser(Map<String,dynamic> body) async{
    await _firestore.collection('user').doc(user!.id).update(body);
  }
}
