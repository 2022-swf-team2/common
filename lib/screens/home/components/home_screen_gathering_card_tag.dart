import 'package:flutter/material.dart';

class HomeScreenGatheringCardTag extends StatelessWidget {
  final List<String> tagList;
  const HomeScreenGatheringCardTag({
    Key? key,
    required this.tagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tagString = '';
    for (String s in tagList) {
      tagString = tagString + '#$s ';
    }
    return Text(
      tagString,
      softWrap: true,
    );
  }
}
