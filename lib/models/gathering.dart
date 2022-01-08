import 'host.dart';

class Gathering {
  final String id;
  final Host host;
  final String title;
  final String category;
  final int participant;
  final int capacity;
  final String openTime;
  final String endTime;
  final String location;
  final String locationDetail;
  final String hostMessage;
  final List<String> tagList;
  final List<String> previousImageList;

  Gathering({
    required this.id,
    required this.host,
    required this.title,
    required this.category,
    required this.participant,
    required this.capacity,
    required this.openTime,
    required this.endTime,
    required this.location,
    required this.locationDetail,
    required this.hostMessage,
    required this.tagList,
    required this.previousImageList,
  });

  factory Gathering.fromJson(Map<String, dynamic> json) => Gathering(
        id: json['id'],
        host: Host.fromJson(json['host']),
        title: json['title'],
        category: json['category'],
        participant: json['participant'],
        capacity: json['capacity'],
        openTime: json['openTime'],
        endTime: json['endTime'],
        location: json['location'],
        locationDetail: json['locationDetail'],
        hostMessage: json['hostMessage'],
        tagList: json['tagList'],
        previousImageList: json['previousImageList'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'host':host.toMap(),
      'title':title,
      'category':category,
      'participant':participant,
      'capacity':capacity,
      'openTime':openTime,
      'endTime':endTime,
      'location':location,
      'locationDetail':locationDetail,
      'hostMessage':hostMessage,
      'tagList':tagList,
      'previousImageList':previousImageList,
    };
  }
}
