import 'package:flutter/material.dart';

class FriendList extends StatelessWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                child: Text(
                  '박민지',
                  style: TextStyle(
                    color: Color(0xFF5665EE),
                    fontFamily: 'Apple SD Gothic Neo',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                child: Text(
                  '오모',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Apple SD Gothic Neo',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                child: Text(
                  '오모2',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Apple SD Gothic Neo',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                child: Text(
                  '오모3',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Apple SD Gothic Neo',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(height: 2),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                child: Text(
                  '오모4',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Apple SD Gothic Neo',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}