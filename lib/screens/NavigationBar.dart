import 'package:flutter/material.dart';
import 'package:omo/colors.dart';

// 새로운 CustomNavigationBar 위젯 정의
class CustomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(66.0); // 높이를 설정합니다.

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: omoBlue, // 배경 색상을 설정합니다.
      child: Align(
        alignment: Alignment.topCenter, // 위쪽 정렬
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0), // 상하 패딩 설정
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  // 홈 버튼 클릭 시 처리
                },
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // 검색 버튼 클릭 시 처리
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  // 알림 버튼 클릭 시 처리
                },
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // 설정 버튼 클릭 시 처리
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}