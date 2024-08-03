import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

// final storage = FlutterSecureStorage();

// class ConnectAPI extends GetxService {
//   final GetConnect connect = Get.put(GetConnect()); // GetConnect 인스턴스 가져오기
//   final storage = FlutterSecureStorage(); // storage 인스턴스

//   var user_favor_data = ''.obs;


class ConnectAPI extends GetxService {
  final GetConnect connect = Get.put(GetConnect()); // GetConnect 인스턴스 가져오기
  final storage = FlutterSecureStorage(); // storage 인스턴스

  var user_favor_data = ''.obs;

  Future<void> tasteFind(int activity, String dateStyle, String interest, String likeFood, String dislikeFood) async {
    final token = await storage.read(key: 'serviceAccessToken');

    // JSON 데이터를 구성합니다.
    Map<String, dynamic> data = {
      "user_activity": activity,
      "date_styles": jsonDecode(dateStyle),
      "favorite_foods": jsonDecode(likeFood),
      "disliked_foods": jsonDecode(dislikeFood),
      "interests": jsonDecode(interest)
    };

    // HTTP POST 요청을 보냅니다.
    Response response = await connect.post(
      'http://kkr010128.iptime.org:12358/api/tastes',
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      print('취향 프로필이 등록되었습니다.');
      return;
    } else if (response.statusCode == 401) {
      print(response.body);
      print('Access Token이 유효하지 않습니다.');
      return;
    } else if (response.statusCode == 404) {
      print(response.body);
      print('사용자의 정보를 찾을 수 없습니다.');
      return;
    } else if (response.statusCode == 409) {
      print(response.body);
      print('이미 사용자의 취향 프로필이 존재합니다.');
      return;
    } else {
      print(response.body);
      print('알 수 없는 오류가 발생했습니다.');
      return;
    }
  }
}
