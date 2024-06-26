import 'package:common/controllers/user_controller.dart';

import '../../../../constants.dart';
import '../../../../models/user.dart';
import 'edit_screen_appbar.dart';
import 'package:flutter/material.dart';

class EditJobScreen extends StatelessWidget {
  final User user;
  EditJobScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditScreenAppBar(
        title: '신상정보',
        onPressed: () async {
          await UserController.to.setUserJob(_controller.text);
          user.setUserJob(_controller.text);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '신상정보',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.clear),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '10글자 이내 직업이나 간략한 신상정보를 적어주세요',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
