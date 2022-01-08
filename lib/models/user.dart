import 'package:common/models/gathering.dart';

class User {
  final String id;
  final String phoneNumber;
  final String name;
  final String university;
  final String job;
  final List<String> userTagList;
  final List<Gathering> applyGatheringList;
  final List<Gathering> openGatheringList;
  final List<Gathering> likeGathering;
  final List<User> likeUser;

  User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.university,
    required this.job,
    required this.userTagList,
    required this.applyGatheringList,
    required this.openGatheringList,
    required this.likeGathering,
    required this.likeUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        name: json['name'],
        university: json['university'],
        job: json['job'],
        userTagList: json['userTagList'],
        applyGatheringList: json['applyGatheringList'].map((Map<String,dynamic> gathering){
          return Gathering.fromJson(gathering);
        }).toList(),
        openGatheringList: json['openGatheringList'].map((Map<String,dynamic> gathering){
          return Gathering.fromJson(gathering);
        }).toList(),
        likeGathering: json['likeGathering'].map((Map<String,dynamic> gathering){
          return Gathering.fromJson(gathering);
        }).toList(),
        likeUser: json['likeUser'].map((Map<String,dynamic> user){
          return User.fromJson(user);
        }).toList(),
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'university': university,
      'job': job,
      'userTagList': userTagList,
      'applyGatheringList': applyGatheringList.map((Gathering gathering){
        return gathering.toMap();
      }).toList(),
      'openGatheringList': openGatheringList.map((Gathering gathering){
        return gathering.toMap();
      }).toList(),
      'likeGathering': likeGathering.map((Gathering gathering){
        return gathering.toMap();
      }).toList(),
      'likeUser': likeUser.map((User user){
        return user.toMap();
      }).toList(),
    };
  }
}
