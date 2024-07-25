import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTravelSchedule extends StatefulWidget {
  final bool isReady;
  const HomeTravelSchedule({super.key, required this.isReady});

  @override
  State<HomeTravelSchedule> createState() => _HomeTravelScheduleState();
}

class _HomeTravelScheduleState extends State<HomeTravelSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("다가오는 여행 일정",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7D848D),
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 7),
          widget.isReady ? ExistSchedule(): NonExistSchedule(),
        ],
      ),
    );
  }
}

class ExistSchedule extends StatelessWidget {
  const ExistSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("역사를 품은 도시 경주",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Icon(Icons.keyboard_arrow_right)
        ]),
        SizedBox(height: 7),
        Text("2024.8.1 ~ 8.2",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
      ],
    );
  }
}

class NonExistSchedule extends StatelessWidget {
  const NonExistSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("🏝️ 여행일정을 추가해보세요",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Icon(Icons.keyboard_arrow_right)
      ],
    );
  }
}
