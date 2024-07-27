import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omo/taste_analysis/view/activity_widget.dart';

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

class TasteButtonsWidget extends StatelessWidget {
  final TasteState tasteState;

  const TasteButtonsWidget({super.key, required this.tasteState});

  @override
  Widget build(BuildContext context) {
    final TasteAnalysisController tasteAnalysisController =
        Get.put(TasteAnalysisController());

    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 52),
        child: Wrap(
          alignment: WrapAlignment.end, // 오른쪽 정렬
          spacing: 10.0, // 버튼 사이의 가로 간격
          runSpacing: 10.0, // 줄 사이의 세로 간격
          children: List.generate(tasteAnalysisController.getLengthOfButton(tasteState), (index) {
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
  final TasteAnalysisScrollerController tasteAnalysisScrollerController =
  Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tasteAnalysisScrollerController.scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TasteAnalysisController tasteAnalysisController = Get.find();

    return Obx(() {
      TasteButton button = tasteAnalysisController.getTasteInput(widget.tasteState, widget.buttonId) as TasteButton;
      return GestureDetector(
        onTap: () => tasteAnalysisController.onPressTasteButton(
            widget.tasteState, button.getId()),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: button.getState() ? Color(0xff5666EE) : Color(0xff7D848D),
              width: button.getState() ? 1 : 0.5,
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

