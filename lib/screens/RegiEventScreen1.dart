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
      body: Container(
        
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LocationSelection(),
              SizedBox(height: 1),
              DropdownList(),
              SizedBox(height: 10),
              TravelPartner(),
              SizedBox(height: 1),
              FriendList(),
              SizedBox(height: 1),
              // Previewmap(),
              Spacer(),
              DateSelectionButton(),
            ],
          ),
        ),
      ),
    );
  }
}