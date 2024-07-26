import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPlaceList extends StatefulWidget {
  final String title;
  final String subTitle;

  const SliderPlaceList({super.key, required this.title, required this.subTitle});

  @override
  State<SliderPlaceList> createState() => _SliderPlaceListState();
}

class _SliderPlaceListState extends State<SliderPlaceList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderPlaceListHeader(title: widget.title, subTitle: widget.subTitle,),
        PlaceListSlider(),
      ],
    );
  }
}

class SliderPlaceListHeader extends StatelessWidget {
  final String title;
  final String subTitle;

  const SliderPlaceListHeader({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "더보기",
                  style: TextStyle(
                      color: Color(0xff5968F0),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: Color(0xff7D848D),
                fontWeight: FontWeight.bold,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}

class SliderPlaceItem extends StatelessWidget {
  const SliderPlaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffD3D3D3), // 테두리 색상
            width: 0.5, // 테두리 두께
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/test_place_img.png',
              height: 120,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "카페 플라비우스",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "경주시 보문로",
                  style: TextStyle(color: Color(0xff7D848D), fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffF5DE0E),
                      size: 12,
                    ),
                    Text(
                      "4.8",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PlaceListSlider extends StatelessWidget {
  const PlaceListSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SliderPlaceItem(),
            SizedBox(width: 10),
            SliderPlaceItem(),
            SizedBox(width: 10),
            SliderPlaceItem(),
            SizedBox(width: 10),
            SliderPlaceItem(),
            SizedBox(width: 10),
            SliderPlaceItem(),
          ],
        ),
      ),
    );
  }
}
