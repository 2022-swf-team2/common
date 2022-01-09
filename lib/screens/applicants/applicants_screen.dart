import 'package:common/models/gathering.dart';
import 'package:common/screens/applicants/components/applicants_screen_select_area.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class ApplicantsScreen extends StatefulWidget {
  final Gathering gathering;
  const ApplicantsScreen({
    Key? key,
    required this.gathering,
  }) : super(key: key);

  @override
  State<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends State<ApplicantsScreen> {
  int _currentSelectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: const Text('신청자 명단'),
      ),
      body: Column(
        children: [
          ApplicantsScreenSelectArea(
            currentIndex: _currentSelectIndex,
            onPressed: (int index) {
              setState(() {
                _currentSelectIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
