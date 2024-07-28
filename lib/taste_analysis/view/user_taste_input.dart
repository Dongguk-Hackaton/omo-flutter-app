import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omo/taste_analysis/view/activity_widget.dart';
import 'package:omo/taste_analysis/view/taste_buttons.dart';

import '../const/taste_state.dart';
import '../controller/taste_analysis_controller.dart';
import '../controller/taste_analysis_scroller_controller.dart';

class UserTasteInput extends StatelessWidget {
  final TasteState tasteState;

  UserTasteInput({super.key, required this.tasteState});

  @override
  Widget build(BuildContext context) {
    final TasteAnalysisController tasteAnalysisController = Get.find();

    if (tasteAnalysisController.currentTasteState == TasteState.activity) {
      return ActivityWidget();
    } else {
      return TasteButtonsWidget(tasteState: tasteState);
    }
  }
}


