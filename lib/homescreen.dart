import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'main.dart';

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
        child: FutureBuilder<Map<String, String?>>(
          future: _getTokens(),
          builder: (BuildContext context, AsyncSnapshot<Map<String, String?>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final access = snapshot.data?['access'];
              final refresh = snapshot.data?['refresh'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Access Token: $access'),
                  Text('Refresh Token: $refresh'),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, String?>> _getTokens() async {
    final access = await storage.read(key: 'serviceAccessToken');
    final refresh = await storage.read(key: 'serviceRefreshToken');
    return {'access': access, 'refresh': refresh};
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