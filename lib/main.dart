import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homescreen.dart'; // 홈 화면을 위한 import

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'd8a06ec1af8730814033bf36e2cb5cba',
    javaScriptAppKey: "a709c6184e105821403aca9715766056",
  );
  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootScreen(),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBackgroundContainer(context), // 배경 컨테이너 생성
    );
  }

  // 배경 컨테이너 위젯 생성
  Widget buildBackgroundContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          buildBackgroundImage(), // 배경 이미지 생성
          Align(
            alignment: Alignment.bottomCenter,
            child: buildContent(context), // 콘텐츠들을 하단에 배치
          ),
        ],
      ),
    );
  }

  // 콘텐츠들을 화면 하단에 위치시키는 메서드
  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40), // 하단 여백 추가
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildLogoImage(), // 로고 이미지 생성
          SizedBox(height: 16), // 로고와 타이틀 텍스트 사이 간격
          buildTitleText(), // 타이틀 텍스트 생성
          SizedBox(height: 32), // 타이틀 텍스트와 카카오 로그인 버튼 사이 간격
          buildKakaoLoginButton(context), // 카카오 로그인 버튼 생성
          SizedBox(height: 20), // 버튼들 사이 간격
          buildAppleLoginButton(context), // Apple 로그인 버튼 생성
          SizedBox(height: 22), // 버튼과 이용 약관 텍스트 사이 간격
          buildTermsText(), // 이용 약관 텍스트 생성
        ],
      ),
    );
  }

  // 배경 이미지 위젯 생성
  Widget buildBackgroundImage() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background.png"), // 로컬 이미지 사용
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // 이용 약관 텍스트 위젯 생성
  Widget buildTermsText() {
    return Container(
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
    );
  }

  // 카카오 로그인 버튼 위젯 생성
  Widget buildKakaoLoginButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await _login(context);
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
    );
  }

  // Apple 로그인 버튼 위젯 생성
  Widget buildAppleLoginButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          
          
          
          // 애플 로그인 처리 로직
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
    );
  }

  // 타이틀 텍스트 위젯 생성
  Widget buildTitleText() {
    return Container(
      width: 341,
      height: 78,
      child: Center(
        child: Text(
          '내 마음에 쏙 드는 코스를 만들고\n함께 추억을 기록해보세요.',
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
    );
  }

  // 로고 이미지 위젯 생성
  Widget buildLogoImage() {
    return Container(
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
    );
  }

  // 카카오 로그인 처리 메서드
  Future<void> _login(BuildContext context) async {
    try {
      if (await isKakaoTalkInstalled()) {
        print('카카오톡이 설치되어 있습니다.');
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡으로 로그인 성공');
          AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
          print('토큰 정보 보기 성공\n회원정보: ${tokenInfo.id}\n만료시간: ${tokenInfo.expiresIn} 초');
          _navigateToHomeScreen(context);
        } catch (error) {
          print('카카오톡으로 로그인 실패 $error');

          if (error is PlatformException && error.code == 'CANCELED') {
            return;
          }

          try {
            await UserApi.instance.loginWithKakaoAccount();
            print('카카오계정으로 로그인 성공');
            AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
            print('토큰 정보 보기 성공\n회원정보: ${tokenInfo.id}\n만료시간: ${tokenInfo.expiresIn} 초');
            _navigateToHomeScreen(context);
          } catch (error) {
            print('카카오계정으로 로그인 실패 $error');
          }
        }
      } else {
          print('카카오톡이 설치되어 있지 않습니다.');
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
          print('토큰 정보 보기 성공\n회원정보: ${tokenInfo.id}\n만료시간: ${tokenInfo.expiresIn} 초');
          User user = await UserApi.instance.me();
          print('사용자 정보 요청 성공\n회원번호: ${user.id}\n닉네임: ${user.kakaoAccount?.profile?.nickname}\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}');
          _navigateToHomeScreen(context);
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } catch (e) {
      print('로그인 과정에서 오류 발생: $e');
    }
  }

  // HomeScreen으로 이동하는 메서드
  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()), // HomeScreen으로 변경
    );
  }
}