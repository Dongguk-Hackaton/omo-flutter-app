import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omo/screens/regi_event_view/common_widget/PreviewMap.dart';
import 'package:omo/screens/regi_event_view/common_widget/RegiEventAppBar.dart';
import 'package:omo/screens/regi_event_view/screen1_widget/DescriptSelectLocation.dart';
import 'package:omo/screens/regi_event_view/screen1_widget/DropdownLocations.dart';
import 'package:omo/screens/regi_event_view/screen1_widget/DescriptPartner.dart';
import 'package:omo/screens/regi_event_view/screen1_widget/ListPartner.dart';
import 'package:omo/screens/regi_event_view/common_widget/PreviewMap.dart';
import 'package:omo/screens/regi_event_view/common_widget/FowardStepButton.dart';
import 'package:omo/screens/regi_event_view/screen1_widget/Calendar.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegiSchedule(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
    );
  }
}

class RegiSchedule extends StatelessWidget {
  const RegiSchedule({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '여행 일정 등록'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LocationSelection(),
              SizedBox(height: 10),
              DropdownList(),
              SizedBox(height: 10),
              TravelPartner(),
              SizedBox(height: 10),
              FriendList(),
              SizedBox(height: 10),
              DateRangeSelector(
                onRangeSelected: (selectedRange) {
                  // 선택된 날짜 범위 처리 코드
                  print('Selected range: ${selectedRange.start} - ${selectedRange.end}');
                },
              ),
              SizedBox(height: 10),
              // PreviewMap(),
              DateSelectionButton(buttonText: '데이트 시간 정하기'),
            ],
          ),
        ),
      ),
    );
  }
}