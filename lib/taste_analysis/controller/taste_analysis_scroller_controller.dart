import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasteAnalysisScrollerController extends GetxController {
  final ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
