import 'package:common/constants.dart';
import 'package:common/controllers/local_controller.dart';
import 'package:common/screens/university/components/university_screen_location_select_area.dart';
import 'package:common/screens/university/components/university_screen_university_select_area.dart';
import 'package:flutter/material.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  _UniversityScreenState createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  final LocalController _localController = LocalController.to;
  int _currentLocationListIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        title: const Text('학교설정'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: UniversityScreenLocationSelectArea(
              currentIndex: _currentLocationListIndex,
              locationList: kLocationList,
              locationClicked: (int index) {
                setState(() {
                  _currentLocationListIndex = index;
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: UniversityScreenUniversitySelectArea(
              universityList: kLocationList[_currentLocationListIndex]
                  ['university'],
              saveUniversity: (String university){
                _localController.setUniversity(university);
              },
            ),
          ),
        ],
      ),
    );
  }
}