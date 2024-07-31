import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omo/taste_registration/view/activity_widget.dart';
import 'package:omo/taste_registration/view/taste_buttons.dart';

import '../const/taste_state.dart';
import '../controller/taste_registration_controller.dart';
import '../controller/taste_registration_scroller_controller.dart';

class UserTasteInput extends StatelessWidget {
  final TasteState tasteState;

  UserTasteInput({super.key, required this.tasteState});

  @override
  Widget build(BuildContext context) {
    final TasteRegistrationController tasteRegistrationController = Get.find();

    if (tasteRegistrationController.currentTasteState == TasteState.activity) {
      return ActivityWidget();
    } else {
      return TasteButtonsWidget(tasteState: tasteState);
    }
  }
}


