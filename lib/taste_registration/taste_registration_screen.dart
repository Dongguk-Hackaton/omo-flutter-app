import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:omo/exception/not_valid_exception.dart';

import 'controller/taste_registration_controller.dart';
import 'controller/taste_registration_scroller_controller.dart';

class TasteAnalysisScreen extends StatelessWidget {
  const TasteAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealTasteAnalysisScreen(),
    );
  }
}

class RealTasteAnalysisScreen extends StatefulWidget {
  const RealTasteAnalysisScreen({super.key});

  @override
  State<RealTasteAnalysisScreen> createState() =>
      _RealTasteAnalysisScreenState();
}

class _RealTasteAnalysisScreenState extends State<RealTasteAnalysisScreen> {
  final TasteRegistrationScrollerController tasteRegistrationScrollerController =
      Get.put(TasteRegistrationScrollerController());

  final TasteRegistrationController tasteRegistrationController =
      Get.put(TasteRegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("오모 에이전트")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 60),
                controller: tasteRegistrationScrollerController.scrollController,
                itemCount: tasteRegistrationController.widgetList.length,
                itemBuilder: (context, index) {
                  return tasteRegistrationController.widgetList[index];
                },
              );
            }),
          ),
        ],
      ),
      bottomSheet: SafeArea(
        child: GestureDetector(
          onTap: () {
            try{
              tasteRegistrationController.updateTasteState();
            }on NotValidException catch(e) {
              showToast(e.errorCode.description);
            }
          },
          child: Container(
            color: Color(0xff8894FF),
            height: 60.0,
            width: double.infinity, // 버튼의 너비를 화면 전체로 설정
            child: Center(
              child: Text(
                '다음',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // 토스트 뜨는 시간 얼마나 길게 할 지 (Android)
      gravity: ToastGravity.BOTTOM, // 토스트 위치 어디에 할 것인지
      timeInSecForIosWeb: 3, // 토스트 뜨는 시간 얼마나 길게 할 지 (iOS & Web)
      backgroundColor: Colors.pinkAccent[100],
    );
  }
}
