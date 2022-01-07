import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignScreenAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: kWhiteColor,
      elevation: 0,
      foregroundColor: Colors.black,
      leading: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.arrow_back_ios),
      ),
      title: Row(
        children: const [
          SizedBox(width: 10),
          Text(
            '회원가입',
            style: TextStyle(color: kBlackColor),
          ),
        ],
      ),
    );
  }


}
