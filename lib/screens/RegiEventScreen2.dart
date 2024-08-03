import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omo/colors.dart';
import 'package:omo/screens/regi_event_view/screen2_widget/DescriptSelectTime.dart';
import 'package:omo/screens/regi_event_view/screen2_widget/DescriptDateCategory.dart';
import 'package:omo/screens/regi_event_view/screen2_widget/TimeBlock.dart';
import 'package:omo/screens/regi_event_view/common_widget/FowardStepButton.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegiSchedule(),
      theme: ThemeData(scaffoldBackgroundColor: omoWhite),
    );
  }
}

class RegiSchedule extends StatelessWidget {
  const RegiSchedule({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('n월 n일 일정'),
        centerTitle: true,
        backgroundColor: omoWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectTime(),
            SizedBox(height: 24),
            DescTravelCategory(),
            SizedBox(height: 1),
            TravelCategorySelector(),
            SizedBox(height: 1),
            // Previewmap(),
            Spacer(),
            DateSelectionButton(buttonText: '맞춤형 코스 추천 받기'),
          ],
        ),
      ),
    );
  }
}