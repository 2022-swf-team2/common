import 'package:flutter/material.dart';
import '../../../components/gathering_card.dart';
import '../../../constants.dart';
import '../../../models/gathering.dart';

class UserScreenGatheringScreen extends StatelessWidget {
  final String title;
  final List<Gathering> gatheringList;
  const UserScreenGatheringScreen({
    Key? key,
    required this.title,
    required this.gatheringList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          title,
          style: const TextStyle(
            color: kBlackColor,
          ),
        ),
      ),
      body: ListView(
        children: gatheringList.map((Gathering gathering) {
          return GatheringCard(
              gathering: gathering,
              userName: gathering.host.name,
              userImageUrl: gathering.host.imageUrl,
              userJob: gathering.host.job,
              gatheringTitle: gathering.title,
              gatheringParticipant: gathering.participant,
              gatheringCapacity: gathering.capacity,
              gatheringOpenTime: gathering.openTime,
              gatheringEndTime: gathering.endTime,
              gatheringPlace: gathering.locationDetail,
              gatheringTagList: gathering.tagList);
        }).toList(),
      ),
    );
  }
}
