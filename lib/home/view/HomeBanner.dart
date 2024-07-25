import 'package:flutter/cupertino.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 33, vertical: 18),
      color: Color(0xffffa4a4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("필요한 만큼의 혜택만, 자유롭게",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text("오모 패스",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 22),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffffffff), // 테두리 색상
                    width: 0.5, // 테두리 두께
                  ),
                  borderRadius: BorderRadius.circular(12), // 둥근 모서리
                ),
                child: Text("보러가기",
                    style: TextStyle(color: Color(0xffffffff), fontSize: 12)),
              ),
            ],
          ),
          Image.asset(
            'assets/img/banner_ticket.png',
            width: 80,
          )
        ],
      ),
    );
  }
}
