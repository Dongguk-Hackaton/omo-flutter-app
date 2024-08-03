import 'package:flutter/material.dart';
import 'package:omo/colors.dart';
import 'package:omo/logout.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      backgroundColor: omoWhite,
      floating: true,
      snap: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/img/symbol_pink.png", width: 36),
          SizedBox(width: 8), // 이미지와 텍스트 사이에 간격 추가
          Text(
            "오늘 모해",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffffa4a4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed: () async {
            await logout(context);
          },
        ),
      ],
    );
  }
}