import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Map<String, String>>(
          future: _getUserInfo(context),
          builder: (BuildContext context, AsyncSnapshot<Map<String, String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final username = snapshot.data?['username'] ?? 'N/A';
              final userimage = snapshot.data?['userimage'] ?? 'N/A';
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username: $username'),
                  Image.network('$userimage'),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, String>> _getUserInfo(BuildContext context) async {
    return await getinfoApi(context);
  }

  Future<void> logout(BuildContext context) async {
    await storage.delete(key: 'serviceAccessToken');
    await storage.delete(key: 'serviceRefreshToken');

    if (!context.mounted) return; // mounted 체크 추가

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => RootScreen()),
      (route) => false,
    );
  }
}

Future<Map<String, String>> getinfoApi(BuildContext context) async {
  final access = await storage.read(key: 'serviceAccessToken');
  final refresh = await storage.read(key: 'serviceRefreshToken');

  if (access == null || refresh == null) {
    navigateToLogin(context);
    throw Exception('Tokens are missing');
  }

  final response = await http.post(
    Uri.parse('http://kkr010128.iptime.org:12358/api/user/info'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $access',
    },
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    String username = responseData['nickname'];
    String userimage = responseData['profileImage'];
    await storage.write(key: 'username', value: username);
    await storage.write(key: 'userimage', value: userimage);
    return {'username': username, 'userimage': userimage};
  } else if (response.statusCode == 401) {
    final regenerate = await http.post(
      Uri.parse('http://kkr010128.iptime.org:12358/api/auth/reissue/token'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access',
        'Authorization-refresh': 'Bearer $refresh',
      },
    );

    if (regenerate.statusCode == 201) {
      final regenerateData = json.decode(regenerate.body);
      String serviceAccessToken = regenerateData['accessToken'];
      await storage.write(key: 'serviceAccessToken', value: serviceAccessToken);

      // 새로 발급받은 토큰으로 다시 사용자 정보를 요청합니다.
      return await getinfoApi(context);
    } else {
      navigateToLogin(context);
      throw Exception('Failed to regenerate token');
    }
  } else {
    navigateToLogin(context);
    throw Exception('Failed to fetch user info');
  }
}

void navigateToLogin(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => RootScreen()),
    (route) => false,
  );
}