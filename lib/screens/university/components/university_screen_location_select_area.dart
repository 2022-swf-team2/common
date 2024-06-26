import 'package:common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversityScreenLocationSelectArea extends StatelessWidget {
  final int currentIndex;
  final List<Map<String, dynamic>> locationList;
  final Function locationClicked;
  const UniversityScreenLocationSelectArea({
    Key? key,required this.currentIndex,
    required this.locationList,
    required this.locationClicked,
  }) : super(key: key);

  void _showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('서비스 지원 미등록 지역'),
          content: const Text(
            '아직 서비스 지원을 하지 않는 지역이예요ㅠㅠ',
            style: TextStyle(fontSize: 12),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('확인'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return SingleChildScrollView(
      child: Column(
        children: locationList.map((Map<String, dynamic> location) {
          int _index = i++;
          return GestureDetector(
            onTap: () {
              if (kLocationList[_index]['university'].isNotEmpty) {
                locationClicked(_index);
              } else {
                _showDialog(context);
              }
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              color: _index == currentIndex?kWhiteColor:kLightGreyColor,
              child: Text(location['city']),
            ),
          );
        }).toList(),
      ),
    );
  }
}
