import 'package:flutter/material.dart';
import 'package:omo/screens/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:omo/logout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('flutter.png'), // 프로필 이미지 경로 설정
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '김광래',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Chip(
                          label: Text('여행메이트'),
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(width: 8),
                        Text('박민지'),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('등급'),
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(width: 8),
                        Text('Gold'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              '기본 정보',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 기본 정보 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '여행 메이트 정보',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 여행 메이트 정보 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '취향 프로필 정보',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 취향 프로필 정보 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '오모패스',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 오모패스 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '여행 정보',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 여행 정보 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '나의 찜',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 나의 찜 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '여행기록',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 여행기록 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '회원 기능',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 회원 기능 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '프로필 업데이트',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 프로필 업데이트 페이지로 이동
            },
          ),
          ListTile(
            title: Text(
              '로그아웃',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              logout(context);
            },
          ),
          ListTile(
            title: Text(
              '회원 탈퇴',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 회원 탈퇴 기능
            },
          ),
        ],
      ),
    );
  }
}