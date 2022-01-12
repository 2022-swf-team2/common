import 'package:flutter/material.dart';
import '../../../constants.dart';

class ProfileScreenEditScreenImageArea extends StatelessWidget {
  final String imageUrl;
  const ProfileScreenEditScreenImageArea({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kBlackColorWithOpacity,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  height: 30,
                  child: const Text(
                    '편집',
                    style: TextStyle(color: kWhiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
