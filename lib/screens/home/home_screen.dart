import 'package:flutter/material.dart';
import '../../controllers/gathering_controller.dart';
import '../../models/gathering.dart';
import '../../components/gathering_card.dart';
import 'components/home_screen_category_area.dart';
import 'components/home_screen_advertise_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GatheringController _gatheringController = GatheringController.to;

  List<Gathering> _gatheringList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gatheringList = _gatheringController.gatheringList;
  }

  Widget _getGatheringCard(List<Gathering> list) {
    return Column(
      children: list.map((Gathering gathering) {
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
          gatheringTagList: gathering.tagList,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeScreenAdvertiseArea(),
          const HomeScreenCategoryArea(),
          const Divider(thickness: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '최근 올라온 모임을 소개해드릴게요!!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _getGatheringCard(_gatheringList),
            ],
          ),
        ],
      ),
    );
  }
}

class RowCheck extends StatelessWidget {
  const RowCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
