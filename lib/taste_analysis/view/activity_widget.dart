import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/taste_analysis_controller.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          _ActivityWidgetWrapper(
            childWidget: Text(
              "나의 활동량은 ",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            topMarginSize: 0,
            bottomMarginSize: 10,
            borderColor: 0xff7D848D,
          ),
          _ActivityWidgetWrapper(
            childWidget: _ActivityNumberInputForm(),
            topMarginSize: 0,
            bottomMarginSize: 0,
            borderColor: 0xff5666EE,
          )
        ],
      ),
    );
  }
}

class _ActivityNumberInputForm extends StatelessWidget {
  const _ActivityNumberInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TasteAnalysisController tasteAnalysisController = Get.find();
    final FocusNode focusNode = FocusNode();

    // Request focus when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    return Obx(() {
      var activityInput = tasteAnalysisController.activityInput.value;

      return SizedBox(
        width: 20, // 필요한 너비로 설정
        child: TextFormField(
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 16),
          cursorColor: Color(0xff5666EE),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            isDense: true,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            hintStyle: TextStyle(
              color: Color(0xffd3cfcf),
            ),
          ),
          textAlign: TextAlign.center,
          onChanged: (value) {
            final intValue = int.tryParse(value);
            if (intValue != null) {
              activityInput.setValue(intValue);
            }
          },
          enabled: activityInput.getEnabled(),
        ),
      );
    });
  }
}


class _ActivityWidgetWrapper extends StatelessWidget {
  final Widget childWidget;
  final double topMarginSize;
  final double bottomMarginSize;
  final int borderColor;

  const _ActivityWidgetWrapper(
      {super.key,
      required this.childWidget,
      required this.topMarginSize,
      required this.bottomMarginSize,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: 22,
              right: 22,
              top: topMarginSize,
              bottom: bottomMarginSize),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(borderColor),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [childWidget],
          ),
        ),
      ],
    );
  }
}
