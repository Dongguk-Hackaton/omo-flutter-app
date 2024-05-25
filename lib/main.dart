import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'd8a06ec1af8730814033bf36e2cb5cba',
    javaScriptAppKey: "a709c6184e105821403aca9715766056",
  );
  // setPathUrlStrategy();
  runApp(const LoginTest());
}

class LoginTest extends StatelessWidget {
  const LoginTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              if (await isKakaoTalkInstalled()) {
                try {
                  await UserApi.instance.loginWithKakaoTalk();
                  print('카카오톡으로 로그인 성공');
                  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
                  print('토큰 정보 보기 성공'
                      '\n회원정보: ${tokenInfo.id}'
                      '\n만료시간: ${tokenInfo.expiresIn} 초');
                } catch (error) {
                  print('카카오톡으로 로그인 실패 $error');

                  // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                  // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                  if (error is PlatformException && error.code == 'CANCELED') {
                    return;
                  }
                  // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                  try {
                    await UserApi.instance.loginWithKakaoAccount();
                    print('카카오계정으로 로그인 성공');
                    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
                    print('토큰 정보 보기 성공'
                        '\n회원정보: ${tokenInfo.id}'
                        '\n만료시간: ${tokenInfo.expiresIn} 초');
                  } catch (error) {
                    print('카카오계정으로 로그인 실패 $error');
                  }
                }
              } else {
                try {
                  await UserApi.instance.loginWithKakaoAccount();
                  print('카카오계정으로 로그인 성공');
                  AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
                  print('토큰 정보 보기 성공'
                      '\n회원정보: ${tokenInfo.id}'
                      '\n만료시간: ${tokenInfo.expiresIn} 초');
                  User user = await UserApi.instance.me();
                  print('사용자 정보 요청 성공'
                      '\n회원번호: ${user.id}'
                      '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                      '\n프로필사진: ${user.kakaoAccount?.profile?.profileImageUrl}');
                } catch (error) {
                  print('카카오계정으로 로그인 실패 $error');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow, // 버튼 색상
              foregroundColor: Colors.black, // 텍스트 색상
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // 모서리 반경 설정
              ),    
            ),
            child: Text('카카오 로그인',
              style: TextStyle(color: Colors.black), // 텍스트 색상
            ),
            // Image.asset('assets/img/kakao_login_large_narrow.png'),
          ),
        ),
      ),
    );
  }
}