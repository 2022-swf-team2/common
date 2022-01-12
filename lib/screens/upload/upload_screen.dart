import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/user_info.dart';
import '../../constants.dart';
import '../../controllers/user_controller.dart';
import '../../models/user.dart';
import 'components/upload_screen_bottom_bar.dart';
import 'components/upload_screen_category_area.dart';
import 'components/upload_screen_date_time_area.dart';
import 'components/upload_screen_gathering_tag_area.dart';
import 'components/upload_screen_guest_area.dart';
import 'components/upload_screen_host_message_area.dart';
import 'components/upload_screen_location_area.dart';
import 'components/upload_screen_location_search_screen.dart';
import 'components/upload_screen_title_area.dart';


class UploadScreen extends StatefulWidget {
  final String category;
  const UploadScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  User? user;
  final UserController _userController = UserController.to;

  //Title 관련
  final TextEditingController _titleController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  //Location 관련
  final TextEditingController _locationDetailController =
      TextEditingController();
  final FocusNode _locationFocusNode = FocusNode();
  String _location = '대전 유성구 대학로 99';
  //Guest 관련
  int _guestCount = 1;
  //DateTime 관련
  final DateTime _nowTime = DateTime.now();
  DateTime _openTime = DateTime.now();
  DateTime _endTime = DateTime.now();
  bool _noEndTime = false;
  //hostMessage 관련
  final TextEditingController _hostMessageController = TextEditingController();
  final FocusNode _hostMessageFocusNode = FocusNode();
  //tag 관련
  final TextEditingController _gatheringTagController = TextEditingController();
  final FocusNode _gatheringTagFocusNode = FocusNode();
  final List<String> _gatheringTagList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _userController.userList[0];
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
          '${user!.name} 호스트',
          style: const TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: UserInfo(
              imageUrl: user!.imageUrl,
              name: user!.name,
              job: user!.job,
              hostTagList: user!.userTagList ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UploadScreenTitleArea(
                  controller: _titleController,
                  focusNode: _titleFocusNode,
                ),
                const UploadScreenCategoryArea(),
                UploadScreenGuestArea(
                    guestCount: _guestCount,
                    onChanged: (double value) {
                      setState(() {
                        _guestCount = value.toInt();
                      });
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '모임정보',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                UploadScreenDateTimeArea(
                  noEnd: _noEndTime,
                  nowTime: _nowTime,
                  openTime: _openTime,
                  endTime: _endTime,
                  noEndPressed: () {
                    setState(() {
                      _noEndTime = !_noEndTime;
                    });
                  },
                  openPressed: (DateTime date) {
                    setState(() {
                      _openTime = date;
                    });
                  },
                  endPressed: (DateTime date) {
                    setState(() {
                      _endTime = date;
                    });
                  },
                ),
                UploadScreenLocationArea(
                  location: _location,
                  focusNode: _locationFocusNode,
                  controller: _locationDetailController,
                  locationUpdated: (String s) {
                    setState(() {
                      _location = s;
                    });
                  },
                  locationSearchPressed: () async {
                    // _connectController
                    String _placeAddress = await Get.to(
                        () => const UploadScreenLocationSearchScreen());
                    setState(() {
                      _location = _placeAddress;
                    });
                  },
                ),
                UploadScreenHostMessageArea(
                  focusNode: _hostMessageFocusNode,
                  controller: _hostMessageController,
                ),
                UploadScreenGatheringTagArea(
                  focusNode: _gatheringTagFocusNode,
                  controller: _gatheringTagController,
                  tagEnterPressed: (String tag) {
                    setState(() {
                      _gatheringTagList.add(tag);
                    });

                  },
                  tagList: _gatheringTagList,
                ),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: UploadScreenBottomBar(
        uploadPressed: () {
          //TODO 등록하기
        },
      ),
    );
  }
}
