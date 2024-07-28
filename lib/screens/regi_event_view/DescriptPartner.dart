import 'package:flutter/material.dart';

class TravelPartner extends StatelessWidget {
  const TravelPartner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              '🙋🏻‍♀️ 여행 동반자',
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
              border: Border.all(color: Colors.orange),
            ),
            child: Text(
              '함께 여행을 갈 사람을 한 명 선택해주세요!',
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