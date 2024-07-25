import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(
            color: Color(0xff6B79F7), // 테두리 색상
            width: 2, // 테두리 두께
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(30), // 둥근 모서리
        ),
        child: FittedBox(
          child: Row(
            children: [
              Text(
                "일정 추가",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.add,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
