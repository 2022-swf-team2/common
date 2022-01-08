import 'package:common/screens/home/components/home_screen_gathering_card_info.dart';
import 'package:common/screens/home/components/home_screen_gathering_card_tag.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomeScreenGatheringCard extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final String userMajor;
  final String userGrade;
  final String gatheringTitle;
  final String gatheringDate;
  final String gatheringTime;
  final String gatheringPlace;
  final List<String> gatheringTagList;
  const HomeScreenGatheringCard({
    Key? key,
    required this.userName,
    required this.userImageUrl,
    required this.userMajor,
    required this.userGrade,
    required this.gatheringTitle,
    required this.gatheringDate,
    required this.gatheringTime,
    required this.gatheringPlace,
    required this.gatheringTagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kLightGreyColor),
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(userImageUrl),
                  ),
                ),
              ),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$userMajor\n$userGrade',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '마감 임박',
                      style: TextStyle(
                        color: kRedColor,
                      ),
                    ),
                    Text(
                      '인원 2/4',
                      style: TextStyle(
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  gatheringTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                HomeScreenGatheringCardInfo(
                  content: gatheringDate,
                  icon: Icons.event_available,
                ),
                HomeScreenGatheringCardInfo(
                  content: gatheringTime,
                  icon: Icons.timer,
                ),
                HomeScreenGatheringCardInfo(
                  content: gatheringPlace,
                  icon: Icons.location_on_outlined,
                ),
                HomeScreenGatheringCardTag(tagList: gatheringTagList,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
