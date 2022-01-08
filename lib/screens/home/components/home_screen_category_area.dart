import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomeScreenCategoryArea extends StatelessWidget {
  const HomeScreenCategoryArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 5,
      children: kCategoryList.map((Map<String, dynamic> category) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category['icon'],
                color: kCategoryGreyColor,
              ),
              Text(
                category['title'],
                style: const TextStyle(
                  color: kCategoryGreyColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
