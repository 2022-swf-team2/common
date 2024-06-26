import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/models/applicant.dart';
import 'package:common/models/gathering.dart';
import 'package:common/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  static DatabaseController get to => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firestorage = FirebaseStorage.instance;

  User? user;

  Future<String?> getUserWithPhoneNumber(String phone) async {
    QuerySnapshot<Map<String, dynamic>> _userData = await _firestore
        .collection('user')
        .where('phoneNumber', isEqualTo: phone)
        .get();
    if (_userData.docs.isEmpty) {
      return null;
    }
    Map<String, dynamic> _user = {
      'id': _userData.docs[0].id,
      ..._userData.docs[0].data(),
    };

    user = User.fromJson(_user);
    update();
    return _userData.docs[0].id;
  }

  Future<void> getCurrentUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await (_firestore.collection('user').doc(id).get());
    if (_dbUser.data() != null) {
      Map<String, dynamic> json = _dbUser.data()!;
      User userData = User.fromJson({
        'id': id,
        ...json,
      });
      user = userData;
    }
    update();
    return;
  }

  Future<User> getUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await (_firestore.collection('user').doc(id).get());

    Map<String, dynamic> json = _dbUser.data()!;
    User userData = User.fromJson({
      'id': _dbUser.id,
      ...json,
    });

    return userData;
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
    DocumentSnapshot<Map<String, dynamic>> _userData =
        await _firestore.collection('user').doc(user!.id).get();
    List _openGatheringList = _userData['openGatheringList'];

    await (_firestore.collection('gathering').add(body)).then((value) {
      Map<String, dynamic> updateBody = {
        'id': value.id,
        ...body,
      };
      _openGatheringList.add(updateBody);
    });

    await _firestore.collection('user').doc(user!.id).update({
      'openGatheringList': _openGatheringList,
    });
  }

  Future<List<User>?> getUserDocs() async {
    QuerySnapshot userData = await _firestore.collection('user').get();
    List<User> userList = [];
    List userDocs = userData.docs;
    for (int i = 0; i < userDocs.length; i++) {
      Map<String, dynamic> body = {
        'id': userDocs[i].id,
        ...userDocs[i].data() as Map<String, dynamic>
      };
      userList.add(User.fromJson(body));
    }
    return userList;
  }

  Future<List<Gathering>?> getGatheringDocs() async {
    QuerySnapshot gatheringData =
        await _firestore.collection('gathering').get();
    List<Gathering> gatheringList = [];
    List gatheringDocs = gatheringData.docs;
    for (int i = 0; i < gatheringDocs.length; i++) {
      Map<String, dynamic> body = {
        'id': gatheringDocs[i].id,
        ...gatheringDocs[i].data() as Map<String, dynamic>
      };
      gatheringList.add(Gathering.fromJson(body));
    }
    return gatheringList;
  }

  Future<void> updateUser(Map<String, dynamic> body) async {
    await _firestore.collection('user').doc(user!.id).update(body);
  }

  Future<String?> updateImage(File file) async {
    String destination = 'images/${user!.id}/profileimage/';
    final ref = _firestorage.ref(destination);
    String? downloadUrl =
        await (ref.putFile(file).snapshot.ref.getDownloadURL());
    return downloadUrl;

  }

  //이용자 입장에서 필요 함수
  Future<void> userApplyGathering(String gatheringId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();

    List _applyList = _gatheringData['applyList'];
    _applyList.add(Applicant(
      userId: user!.id,
      name: user!.name,
      imageUrl: user!.imageUrl,
      job: user!.job,
      userTagList: user!.userTagList,
    ).toMap());
    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'applyList': _applyList});

    DocumentSnapshot<Map<String, dynamic>> _dbUser =
        await _firestore.collection('user').doc(user!.id).get();
    List _applyGatheringList = _dbUser['applyGatheringList'];
    _applyGatheringList.add({'id': gatheringId, ...?_gatheringData.data()});
    await _firestore.collection('user').doc(user!.id).update({
      'applyGatheringList': _applyGatheringList,
    });
    return;
  }

  Future<void> userCancelGathering(String gatheringId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _cancelList = _gatheringData['cancelList'];
    _cancelList.add(Applicant(
      userId: user!.id,
      name: user!.name,
      imageUrl: user!.imageUrl,
      job: user!.job,
      userTagList: user!.userTagList,
    ).toMap());
    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'cancelList': _cancelList});
  }

  //주최자 입장에서 필요 함수
  Future<void> userApproveGathering(
      String gatheringId, String applicantId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();

    List _applyList = _gatheringData['applyList'];
    int _index = _applyList
        .indexWhere((applicant) => applicant['userId'] == applicantId);
    if(_index >-1){
      List _approvalList = _gatheringData['approvalList'];
      _approvalList.add(_applyList[_index]);
      _applyList.removeAt(_index);

      await _firestore.collection('gathering').doc(gatheringId).update({
        'approvalList': _approvalList,
        'applyList': _applyList,
      });

      DocumentSnapshot<Map<String, dynamic>> _applicantData =
      await _firestore.collection('user').doc(applicantId).get();
      List _applyGatheringList = _applicantData['applyGatheringList'];
      _applyGatheringList
          .add({'id': _gatheringData.id, ..._gatheringData.data()!});

      await _firestore
          .collection('user')
          .doc(applicantId)
          .update({'applyGatheringList': _applyGatheringList});
    }

  }

  Future<void> removeUserInApprovalList(
      String gatheringId, String applicantId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _approvalList = _gatheringData['approvalList'];

    _approvalList
        .removeWhere((applicant) => applicant['userId'] == applicantId);

    await _firestore.collection('gathering').doc(gatheringId).update({
      'approvalList': _approvalList,
    });
  }

  Future<void> cancelApproveUser(String gatheringId, String applicantId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _approvalList = _gatheringData['approvalList'];
    List _cancelList = _gatheringData['cancelList'];
    _approvalList
        .removeWhere((applicant) => applicant['userId'] == applicantId);
    _cancelList.removeWhere((applicant) => applicant['userId'] == applicantId);

    await _firestore.collection('gathering').doc(gatheringId).update({
      'approvalList': _approvalList,
      'cancelList': _cancelList,
    });
  }

  Future<void> cancelDeleteUser(String gatheringId, String applicantId) async {
    DocumentSnapshot<Map<String, dynamic>> _gatheringData =
        await _firestore.collection('gathering').doc(gatheringId).get();
    List _cancelList = _gatheringData['cancelList'];
    _cancelList.removeWhere((applicant) => applicant['userId'] == applicantId);

    await _firestore
        .collection('gathering')
        .doc(gatheringId)
        .update({'cancelList': _cancelList});
  }
}
