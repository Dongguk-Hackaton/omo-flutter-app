import 'package:flutter/material.dart';

// 새로운 AppBar 위젯 정의
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // 변경된 부분
        children: [
          Image.asset("assets/img/symbol_pink.png", width: 36,),
          SizedBox(width: 8), // 이미지와 텍스트 사이에 간격 추가
          Text(
            "오늘 모해",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xffffa4a4),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
