import 'package:flutter/material.dart';
import 'package:omo/colors.dart';

class DateSelectionButton extends StatelessWidget {
  final String buttonText; // 버튼 텍스트를 받을 변수

  const DateSelectionButton({
    Key? key,
    required this.buttonText, // 버튼 텍스트를 필수로 받도록 설정
  }) : super(key: key);

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
            onPressed: () {
              // 버튼 클릭 시 동작을 여기에 추가
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: omoBlue, // primary 대신 backgroundColor 사용
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              buttonText, // 전달받은 버튼 텍스트 사용
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}