import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildBackgroundContainer(context), // 배경 컨테이너 생성
        ],
      ),
    );
  }

  // 배경 컨테이너 위젯 생성
  Widget buildBackgroundContainer(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          buildBackgroundImage(), // 배경 이미지 생성
          buildTermsText(), // 이용 약관 텍스트 생성
          buildKakaoLoginButton(context), // 카카오 로그인 버튼 생성
          buildAppleLoginButton(context), // Apple 로그인 버튼 생성
          buildTitleText(), // 타이틀 텍스트 생성
          buildLogoImage(), // 로고 이미지 생성
        ],
      ),
    );
  }

  // 배경 이미지 위젯 생성
  Widget buildBackgroundImage() {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 393,
        height: 852,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background.png"), // 로컬 이미지 사용
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  // 이용 약관 텍스트 위젯 생성
  Widget buildTermsText() {
    return Positioned(
      left: 26,
      top: 783,
      child: Container(
        width: 341,
        height: 42,
        child: Center(
          child: Text(
            '로그인 하면 오모의 이용약관, 개인정보 처리방침에\n동의하게 됩니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Apple SD Gothic Neo',
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  // 카카오 로그인 버튼 위젯 생성
  Widget buildKakaoLoginButton(BuildContext context) {
    return Positioned(
      left: 23,
      top: 642,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // 스낵바 메시지 출력
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('카카오로 로그인'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Container(
            width: 348,
            height: 49,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Color(0xFFFEE500), // 카카오 노란색
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 2), // 그림자 위치
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/kakao_sym.png', // 카카오 로고 이미지
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8), // 로고와 텍스트 사이 간격 추가
                Text(
                  '카카오로 로그인',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Apple SD Gothic Neo',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Apple 로그인 버튼 위젯 생성
  Widget buildAppleLoginButton(BuildContext context) {
    return Positioned(
      left: 23,
      top: 711,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // 스낵바 메시지 출력
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Apple로 로그인'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Container(
            width: 348,
            height: 52.56,
            decoration: BoxDecoration(
              color: Colors.black, // 애플 검정색
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 2), // 그림자 위치
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/apple_sym.png', // 애플 로고 이미지
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8), // 로고와 텍스트 사이 간격 추가
                Text(
                  'Apple로 로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Apple SD Gothic Neo',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 타이틀 텍스트 위젯 생성
  Widget buildTitleText() {
    return Positioned(
      left: 26,
      top: 503,
      child: Container(
        width: 341,
        height: 78,
        child: Center(
          child: Text(
            '내 마음에 쏙 드는 코스를 만들고,\n함께 추억을 기록해보세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'Apple SD Gothic Neo',
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  // 로고 이미지 위젯 생성
  Widget buildLogoImage() {
    return Positioned(
      left: 154,
      top: 398,
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/omo_sym.png"), // 로컬 이미지 사용
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000),
              blurRadius: 100.90,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}