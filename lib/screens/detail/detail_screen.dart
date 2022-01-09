import 'package:common/components/user_gathering_status.dart';
import 'package:common/screens/applicants/applicants_screen.dart';
import 'package:common/screens/detail/components/detail_screen_gathering_applicants_check_button.dart';
import 'package:common/screens/detail/components/detail_screen_host_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../models/gathering.dart';
import 'components/detail_screen_gathering_date_time.dart';
import '../../components/user_info.dart';
import 'components/detail_screen_gathering_info_card.dart';
import 'components/detail_screen_gathering_progress_bar.dart';
import 'components/detail_screen_user_bottom_bar.dart';
import 'components/detail_screen_gathering_hash_tag.dart';
import 'components/detail_screen_gathering_place.dart';
import 'components/detail_screen_gathering_place_info.dart';
import 'components/detail_screen_previous_gathering_image.dart';

class DetailScreen extends StatefulWidget {
  final Gathering gathering;
  final bool isHost;
  const DetailScreen({
    Key? key,
    required this.gathering,
    required this.isHost,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.isHost);
  }

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: Column(
        children: [
          widget.isHost ? Container() : const UserGatheringStatus(
            //TODO 여기서 유저의 현재상태에 따라 어떤식의 text를 띄워줄지 정해야함
            content: '신청중입니다',
          ),
          Expanded(
            child: ListView(
              children: [
                UserInfo(
                  imageUrl: widget.gathering.host.imageUrl,
                  name: widget.gathering.host.name,
                  job: widget.gathering.host.job,
                  hostTagList: widget.gathering.host.userTagList,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                widget.isHost
                    ? DetailScreenGatheringApplicantsCheckButton(
                        onPressed: () {
                          Get.to(() => const ApplicantsScreen());
                        },
                      )
                    : Container(),
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
                widget.gathering.previousImageList.isNotEmpty
                    ? DetailScreenPreviousGatheringImage(
                        imageList: widget.gathering.previousImageList,
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.isHost
          ? DetailScreenHostBottomBar(
              onPressed: () {},
            )
          : DetailScreenUserBottomBar(
              chatPressed: () {},
              applyPressed: () {},
            ),
    );
  }
}