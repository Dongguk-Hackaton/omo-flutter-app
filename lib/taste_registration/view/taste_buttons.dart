import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../const/taste_state.dart';
import '../controller/taste_registration_controller.dart';
import '../controller/taste_registration_scroller_controller.dart';

class TasteButtonsWidget extends StatelessWidget {
  final TasteState tasteState;

  const TasteButtonsWidget({super.key, required this.tasteState});

  @override
  Widget build(BuildContext context) {
    final TasteRegistrationController tasteRegistrationController =
    Get.put(TasteRegistrationController());

    return Obx(
          () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        child: Wrap(
          alignment: WrapAlignment.end, // 오른쪽 정렬
          spacing: 10.0, // 버튼 사이의 가로 간격
          runSpacing: 10.0, // 줄 사이의 세로 간격
          children: List.generate(tasteRegistrationController.getLengthOfButton(tasteState), (index) {
            return TasteButtonWidget(
                buttonId: index, tasteState: tasteState);
          }),
        ),
      ),
    );
  }
}

class TasteButtonWidget extends StatefulWidget {
  final int buttonId;
  final TasteState tasteState;

  const TasteButtonWidget(
      {super.key, required this.buttonId, required this.tasteState});

  @override
  State<TasteButtonWidget> createState() => _TasteButtonWidgetState();
}

class _TasteButtonWidgetState extends State<TasteButtonWidget> {
  final TasteRegistrationScrollerController tasteRegistrationScrollerController =
  Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tasteRegistrationScrollerController.scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TasteRegistrationController tasteRegistrationController = Get.find();

    return Obx(() {
      TasteButton button = tasteRegistrationController.getTasteInput(widget.tasteState, widget.buttonId) as TasteButton;
      return GestureDetector(
        onTap: () => tasteRegistrationController.onPressTasteButton(
            widget.tasteState, button.getId()),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: button.getState() ? Color(0xff5666EE) : Color(0xff7D848D),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            button.getName(),
            style: TextStyle(
              fontSize: 14,
              color: button.getState() ? Color(0xff5666EE) : Color(0xff000000),
            ),
          ),
        ),
      );
    });
  }
}
