import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/models/gathering.dart';
import 'package:common/models/user.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  static DatabaseController get to => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> getUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await (_firestore.collection('user').doc('EGGp0VhOeiRn81YeZIuW').get());

    Map<String, dynamic> json = _dbUser.data()!;
    User user = User.fromJson({
      'id':_dbUser.id,
      ...json,
    });
    return user;
  }

  Future<bool> checkPhoneNumberIsDuplicated(String phoneNumber)async{
    QuerySnapshot _dbPhoneList = await (_firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get());
    List _getPhoneList = _dbPhoneList.docs.toList();
    return _getPhoneList.isEmpty;
  }

  Future<bool> checkNameIsDuplicated(String name)async{
    QuerySnapshot _dbNameList = await (_firestore
        .collection('user')
        .where('name', isEqualTo: name)
        .get());
    List _getNameList = _dbNameList.docs.toList();
    return _getNameList.isEmpty;
  }
}
