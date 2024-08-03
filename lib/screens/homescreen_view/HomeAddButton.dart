import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omo/screens/RegiEventScreen1.dart'; // 경로는 실제 위치에 맞게 조정

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(RegiSchedule()); // GetX의 Get.to() 메서드를 사용하여 화면 이동
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 44),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                "코스 등록",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
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