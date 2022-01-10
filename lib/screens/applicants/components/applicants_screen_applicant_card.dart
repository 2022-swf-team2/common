import 'package:flutter/material.dart';
import 'applicants_screen_applicant_card_info.dart';
import '../../../models/applicant.dart';
import '../../../constants.dart';

class ApplicantsScreenApplicantCard extends StatelessWidget {
  final Applicant applicant;
  final bool followed;
  final int currentIndex;
  const ApplicantsScreenApplicantCard({
    Key? key,
    required this.applicant,
    required this.followed,
    required this.currentIndex,
  }) : super(key: key);

  Widget _getButton(){
    switch(currentIndex){
      case 0:
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '승인 완료',
              style: TextStyle(
                color: kWhiteColor,
              ),
            ),
          ),
        );
      case 1:
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: kRedColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '승인 대기로 보내기',
              style: TextStyle(
                color: kRedColor,
              ),
            ),
          ),
        );
      default:
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: kRedColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '취소 요청 승인',
              style: TextStyle(
                color: kRedColor,
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ApplicantsScreenApplicantCardInfo(
          imageUrl: applicant.imageUrl,
          name: applicant.name,
          job: applicant.job,
          userTagList: applicant.userTagList,
          followed: followed,
        ),
        Row(
          children: [
            const SizedBox(width: 10),
_getButton(),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '상세보기',
                  style: TextStyle(
                    color: kGreyColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: kGreyColor,
          ),
        ),
      ],
    );
  }
}
