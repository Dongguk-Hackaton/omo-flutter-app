import 'package:flutter/material.dart';
import 'package:omo/colors.dart';

class DateSelectionButton extends StatelessWidget {
  const DateSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Center(
        child: Container(
          width: 350, // 너비 설정
          height: 50, // 높이 설정
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // 모서리 반경 설정
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: omoBlue, // primary 대신 backgroundColor 사용
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              '날짜 선택하기',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 17,
                fontWeight: FontWeight.w500
                ),
            ),
          ),
        ),
      ),
    );
  }
}