import 'package:flutter/material.dart';

const Color kWhiteColor = Color(0xFFFAFAFA);
const Color kBlackColor = Color(0xFF000000);
const Color kBlueColor = Color(0xFF51B6FF);
const Color kGreyColor = Color(0xFF979797);
const Color kLightGreyColor = Color(0xFFE9E9E9);
const Color kRedColor = Color(0xFFFF0000);

final List<String> kAdvertisementImageList = [
  'assets/images/cafe_1.jpeg',
  'assets/images/exercise_1.jpeg',
  'assets/images/study_1.jpeg',
  'assets/images/travel_1.jpeg',
];
final List<Map<String,dynamic>> kCategoryList = [
  {
    'title':'스터디',
    'icon':Icons.local_library,
  },
  {
    'title':'공모전',
    'icon':Icons.people
  },
  {
    'title':'운동',
    'icon':Icons.fitness_center
  },
  {
    'title':'베이킹',
    'icon':Icons.restaurant_menu
  },
  {
    'title':'카페',
    'icon':Icons.local_cafe
  },
  {
    'title':'음주',
    'icon':Icons.local_bar
  },
  {
    'title':'공예',
    'icon':Icons.edit
  },
  {
    'title':'음악',
    'icon':Icons.headset
  },
  {
    'title':'여행',
    'icon':Icons.flight
  },
  {
    'title':'전체보기',
    'icon':Icons.grid_on
  },
];

final List<Map<String, dynamic>> kLocationList = [
  {
    'city': '대전',
    'university': [
      '대전과학기술대학교',
      '대전대학교',
      '목원대학교',
      '배재대학교',
      '우송대학교',
      '을지대학교 대전캠퍼스',
      '충남대학교',
      '한국과학기술대학교',
      '한남대학교',
      '한밭대학교'
    ],
  },
  {
    'city': '충북',
    'university': [],
  },
  {
    'city': '충남/세종',
    'university': [],
  },
  {
    'city': '서울',
    'university': [],
  },
  {
    'city': '인천',
    'university': [],
  },
  {
    'city': '경기',
    'university': [],
  },
  {
    'city': '강원',
    'university': [],
  },
  {
    'city': '광주',
    'university': [],
  },
  {
    'city': '전북/전주',
    'university': [],
  },
  {
    'city': '전남',
    'university': [],
  },
  {
    'city': '대구',
    'university': [],
  },
  {
    'city': '울산',
    'university': [],
  },
  {
    'city': '부산',
    'university': [],
  },
  {
    'city': '경북',
    'university': [],
  }
];

// GestureDetector(
// onTap: () {
// DatePicker.showDateTimePicker(
// context,
// showTitleActions: true,
// locale: LocaleType.ko,
// minTime: _startTime,
// maxTime: DateTime(2023, 1, 5,13),
// onChanged: (DateTime date) {
// print(date);
// },
// );
// },
// child: Container(
// padding: const EdgeInsets.all(40),
// color: Colors.red,
// child: Text('지도선택하기'),
// ),
// ),
