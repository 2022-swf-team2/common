import 'package:common/constants.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 0,
        title: Text(category),
      ),
    );
  }
}
