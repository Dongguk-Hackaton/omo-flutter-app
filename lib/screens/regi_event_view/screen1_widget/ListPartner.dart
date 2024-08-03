import 'package:flutter/material.dart';
import 'package:omo/colors.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  // 선택된 친구의 인덱스
  int? _selectedIndex;

  // 친구 목록 데이터
  final List<Map<String, dynamic>> _friends = [
    {'name': '친구1', 'color': omoBlue},
    {'name': '친구2', 'color': omoBlue},
    {'name': '친구3', 'color': omoBlue},
    {'name': '친구4', 'color': omoBlue},
    {'name': '친구5', 'color': omoBlue},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_friends.length, (index) {
            final friend = _friends[index];
            final isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // 친구 간의 간격
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 프로필 사진
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                      ),
                      child: CircleAvatar(
                        radius: 24, // 프로필 사진 크기 조정
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5), // 프로필 사진과 이름 사이의 간격
                    // 이름
                    Text(
                      friend['name'],
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.black,
                        fontFamily: 'Apple SD Gothic Neo',
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                    // 라디오 버튼
                    Visibility(
                      visible: false, // 라디오 버튼은 숨김
                      child: Radio<int>(
                        value: index,
                        groupValue: _selectedIndex,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedIndex = value;
                          });
                        },
                        activeColor: friend['color'], // 선택된 항목의 색상
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}