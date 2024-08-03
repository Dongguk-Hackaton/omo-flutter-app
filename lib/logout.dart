// logout.dart

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:omo/main.dart'; // RootScreen 경로를 올바르게 설정하세요.

final storage = FlutterSecureStorage();

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