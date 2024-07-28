import 'package:flutter/material.dart';

class LocationSelection extends StatelessWidget {
  const LocationSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: Text(
              '🏝️ 여행지 선택',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: Text(
              '가고싶은 여행지를 선택해주세요',
              style: TextStyle(
                color: Color(0xFF7D848D),
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}