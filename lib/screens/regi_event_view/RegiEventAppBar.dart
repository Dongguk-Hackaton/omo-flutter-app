import 'package:flutter/material.dart';
import 'package:omo/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: omoWhite, // omoBlue 대신 직접 색상 사용
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}