import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen();

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
            Text('Access Token: '),
            Text('Refresh Token: '),
          ],
        ),
      ),
    );
  }
}