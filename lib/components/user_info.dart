import 'package:flutter/material.dart';
import '../screens/detail/components/detail_screen_gathering_tag.dart';
import '../constants.dart';

class UserInfo extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String job;
  final List<String> hostTagList;
  const UserInfo({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.job,
    required this.hostTagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: kBlackColor, fontSize: 15),
                    children: [
                      TextSpan(
                          text: name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(text: ' | $job'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                DetailScreenGatheringTag(tagList: hostTagList),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
