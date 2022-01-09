import 'package:common/components/user_gathering_status.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/gathering.dart';
import 'components/detail_screen_gathering_date_time.dart';
import 'components/detail_screen_gathering_host.dart';
import 'components/detail_screen_gathering_info_card.dart';
import 'components/detail_screen_gathering_progress_bar.dart';
import 'components/detail_screen_bottom_bar.dart';
import 'components/detail_screen_gathering_hash_tag.dart';
import 'components/detail_screen_gathering_place.dart';
import 'components/detail_screen_gathering_place_info.dart';
import 'components/detail_screen_previous_gathering_image.dart';

class DetailScreen extends StatefulWidget {
  final Gathering gathering;
  const DetailScreen({
    Key? key,
    required this.gathering,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kGreyColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 1,
        title: Text(
          '${widget.gathering.host.name} 호스트',
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        //TODO userId == hostId일 경우에 보여주고 아니면 가린다
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.people)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: Column(
        children: [
          const UserGatheringStatus(),
          Expanded(
            child: ListView(
              children: [
                DetailScreenGatheringHost(
                  imageUrl: widget.gathering.host.imageUrl,
                  name: widget.gathering.host.name,
                  job: widget.gathering.host.job,
                  hostTagList: widget.gathering.host.userTagList,
                ),
                DetailScreenGatheringInfoCard(
                  title: '제목',
                  content: widget.gathering.title,
                  icon: Icons.star,
                  iconColor: kYellowColor,
                ),
                DetailScreenGatheringInfoCard(
                  title: '카테고리',
                  content: widget.gathering.category,
                  icon: Icons.category,
                ),
                const DetailScreenGatheringProgressBar(
                  participantCount: 40,
                  capacity: 55,
                ),
                DetailScreenGatheringDateTime(
                  openTime: widget.gathering.openTime,
                  endTime: widget.gathering.endTime,
                ),
                const DetailScreenGatheringPlace(),
                DetailScreenGatheringPlaceInfo(
                  location: widget.gathering.location,
                  locationDetail: widget.gathering.locationDetail,
                  hostMessage: widget.gathering.hostMessage,
                ),
                DetailScreenGatheringHashTag(
                  tagList: widget.gathering.tagList,
                ),
                DetailScreenPreviousGatheringImage(
                  imageList: widget.gathering.previousImageList,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DetailScreenBottomBar(
        chatPressed: () {},
        applyPressed: () {},
      ),
    );
  }
}
