import 'package:common/components/gathering_card.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/models/gathering.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GatheringController _gatheringController = GatheringController.to;
  List<Gathering> _gatheringList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gatheringController
        .setCategoryGatheringList(widget.category)
        .then((value) {
      setState(() {
        _gatheringList = _gatheringController.categoryGatheringList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          widget.category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: _gatheringList.map((Gathering gathering) {
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kYellowColor,
        foregroundColor: kWhiteColor,
        child: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
