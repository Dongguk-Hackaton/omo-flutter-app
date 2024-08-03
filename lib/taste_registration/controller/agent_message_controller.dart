import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:omo/taste_registration/const/taste_state.dart';

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
      "반가워요 광래님!\n저는 광래님의 추천 에이전트 오모라고 해요.", // API로 사용자 이름 받아오기
      "먼저 몇 가지 질문에 답해주시면 취향 정보를\n등록해드릴게요!",
      "광래님의 활동량은 어떻게 되시나요?",
      "숫자를 입력해주시면 추천해드릴 코스의\n활동 반경을 위한 기준으로 사용할게요.\n0에 가까울수록 가까운 반경을,\n멀수록 먼 거리까지 추천해드릴게요.",
      "0 ~ 9사이의 값을 입력해주세요!",
    ];
    var dateStyleMessages = ["입력해주셔서 감사해요!","다음으로는 선호하는 데이트 스타일들 목록이예요", "광래님이 선호하는 것을 5개 이하로 선택해주세요"];
    var interestMessages = ["취향이 저랑 비슷하시군요!","그렇다면, 요즘 관심사가 어떻게 되시나요?","관심있는 것들을 5개 이하로 선택해주세요"];
    var likeFoodMessages = ["알려주셔서 감사해요. 거의 다 됐어요!","광래님은 어떤 음식을 좋아하시나요?", "선호하는 음식을 4개 이하로 선택해주세요"];
    var dislikeFoodMessages = ["입력해주셔서 감사해요.","이제 모든 정보를 다 받았어요!","마지막으로 싫어하는 음식을 알려주시면\n입력한 정보를 바탕으로 광래님에게\n딱 맞는 추천을 해드릴게요!"];

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
