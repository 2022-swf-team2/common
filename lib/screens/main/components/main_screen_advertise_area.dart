import 'package:carousel_slider/carousel_slider.dart';
import 'package:common/constants.dart';
import 'package:flutter/material.dart';

class MainScreenAdvertiseArea extends StatelessWidget {
  const MainScreenAdvertiseArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //점찍는건 index랑 배열길이에맞게 커스터마이징 -> container의 child요소가 없어서 위치설정해서 주면 된다
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width*0.5,
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: kAdvertisementImageList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(i),
                    fit: BoxFit.fill
                ),
              ),

            );
          },
        );
      }).toList(),
    );
  }
}
