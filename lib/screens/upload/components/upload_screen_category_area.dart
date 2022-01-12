import 'package:flutter/material.dart';
import 'upload_screen_icon_text.dart';

class UploadScreenCategoryArea extends StatelessWidget {
  const UploadScreenCategoryArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '카테고리',
            style:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        UploadScreenIconText(
          title: '스터디',
          icon: Icons.local_library,
        ),
      ],
    );
  }
}
