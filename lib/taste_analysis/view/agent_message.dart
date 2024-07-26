import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omo/taste_analysis/const/agent_speech_bubble_shape_type.dart';
import 'package:omo/taste_analysis/view/agent_speech_bubble.dart';

import '../const/taste_state.dart';
import '../controller/agent_message_controller.dart';

class AgentMessage extends StatelessWidget {
  final TasteState tasteState;

  const AgentMessage({super.key, required this.tasteState});

  @override
  Widget build(BuildContext context) {
    final AgentMessageController controller = Get.put(
      AgentMessageController(tasteState),
      tag: 'agentMessageControllerTag',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < controller.count.value; index++)
                AgentSpeechBubble(
                  message: controller.targetMessages[index],
                  shape: AgentSpeechBubbleShapeType.type2,
                ),
            ],
          );
        }),
        Obx(() => Container(child: controller.userTasteInputWidget.value)),
      ],
    );
  }
}
