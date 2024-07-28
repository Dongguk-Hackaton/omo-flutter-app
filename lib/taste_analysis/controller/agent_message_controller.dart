import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:omo/taste_analysis/const/taste_state.dart';

import '../view/user_taste_input.dart';

class AgentMessageController extends GetxController {
  final TasteState currentTasteState;

  var userTasteInputWidget =
      Rx<Widget>(const SizedBox()); // Initialize with a default widget

  RxList<String> targetShowAgentMessages = RxList();
  var targetMessages;
  var index = 0.obs;
  late Timer timer;

  AgentMessageController(this.currentTasteState) {
    var activityMessage = [
      "반가워요 광래님!\n저는 광래님의 추천 에이전트 오모라고 해요.",
      "먼저 몇 가지 질문에 답해주시면 취향 정보를 등록해드릴게요!",
      "광래님의 활동량은 어떻게 되시나요?",
      "0 ~ 9사이의 값을 입력해주세요!"
    ];
    var dateStyleMessages = ["선호하는 데이트 스타일들 목록이예요", "광래님이 선호하는 거 3개만 선택해주세요"];
    var interestMessages = [
      "취향이 저랑 비슷하시군요!",
      "요즘 관심사가 어떻게 되시나요?",
      "광래님이 선호하는 것 3개만 선택해주세요"
    ];
    var likeFoodMessages = ["음식은 어떤 것을 좋아하시나요?", "광래님이 선호하는 것 3개만 선택해주세요"];
    var dislikeFoodMessages = [
      "그렇다면 싫어하는 음식도 3개만 알려주세요!",
    ];

    switch (currentTasteState) {
      case TasteState.activity:
        targetMessages = activityMessage;
      case TasteState.dateStyle:
        targetMessages = dateStyleMessages;
        break;
      case TasteState.interest:
        targetMessages = interestMessages;
        break;
      case TasteState.likeFood:
        targetMessages = likeFoodMessages;
        break;
      case TasteState.dislikeFood:
        targetMessages = dislikeFoodMessages;
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    showAgentMessage();
  }

  void showAgentMessage() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (index.value < targetMessages.length) {
        targetShowAgentMessages.add(targetMessages[index.value]);
        index++;
      } else {
        timer.cancel();
        userTasteInputWidget.value =
            UserTasteInput(tasteState: currentTasteState);
        Get.delete<AgentMessageController>(tag: 'agentMessageControllerTag');
      }
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
