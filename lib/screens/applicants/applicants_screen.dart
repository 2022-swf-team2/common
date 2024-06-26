import 'package:common/components/user_gathering_status.dart';
import 'package:common/controllers/database_controller.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/models/applicant.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/applicants_screen_select_area.dart';
import 'components/applicants_screen_applicant_card.dart';
import '../../constants.dart';
import '../../../models/gathering.dart';

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
  //TODO 실시간으로 보여줄때는 _applicantsList에서 removeAt/add 사용
  List _applicantsList = [];

  Widget _getApplicantsCard() {
    switch (_currentSelectIndex) {
      case 0:
        _applicantsList = widget.gathering.applyList;
        break;
      case 1:
        _applicantsList = widget.gathering.approvalList;
        break;
      default:
        _applicantsList = widget.gathering.cancelList;
        break;
    }

    return ListView(
      children: _applicantsList.map((applicant) {
        return ApplicantsScreenApplicantCard(
          gathering: widget.gathering,
          applicant: applicant,
          followed: false,
          currentIndex: _currentSelectIndex,
          updateFunction: () async {
            await DatabaseController.to
                .getCurrentUser(DatabaseController.to.user!.id);
            setState(() {});
          },
          approveFunction: () async{
            await  DatabaseController.to.userApproveGathering(widget.gathering.id, applicant.userId);
            widget.gathering.approvalList.add(applicant);
            widget.gathering.applyList.remove(applicant);
            setState(() {

            });
          },
          removeInApprovalFunction: () async{
            await  DatabaseController.to.removeUserInApprovalList(widget.gathering.id, applicant.userId);
            widget.gathering.approvalList.remove(applicant);setState(() {

            });
          },
          cancelApproveFunction: ()async{
           await  DatabaseController.to.cancelApproveUser(widget.gathering.id, applicant.userId);
            widget.gathering.approvalList.remove(applicant);
            widget.gathering.cancelList.remove(applicant);setState(() {

           });
          },
          cancelDeleteFunction: ()async{
            await  DatabaseController.to.cancelDeleteUser(widget.gathering.id, applicant.userId);
            widget.gathering.cancelList.remove(applicant);setState(() {

            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: const Text(
          '신청자 명단',
          style: TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          widget.gathering.participant > 0
              ? UserGatheringStatus(
                  content:
                      '${widget.gathering.capacity}명 중 ${widget.gathering.participant}명 모집 완료!!',
                )
              : Container(),
          Expanded(
            child: _getApplicantsCard(),
          ),
        ],
      ),
    );
  }
}
