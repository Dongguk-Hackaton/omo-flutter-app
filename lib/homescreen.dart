import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String serviceAccessToken;
  final String serviceRefreshToken;

  HomeScreen({required this.serviceAccessToken, required this.serviceRefreshToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Access Token: $serviceAccessToken'),
            Text('Refresh Token: $serviceRefreshToken'),
          ],
        ),
      ),
    );
  }
}