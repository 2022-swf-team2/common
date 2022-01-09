import 'package:flutter/material.dart';
import '../../constants.dart';

class ApplicantsScreen extends StatelessWidget {
  const ApplicantsScreen({Key? key}) : super(key: key);

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
        children: [],
      ),
    );
  }
}
