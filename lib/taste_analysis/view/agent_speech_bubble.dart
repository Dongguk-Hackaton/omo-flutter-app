import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omo/taste_analysis/const/agent_speech_bubble_shape_type.dart';

import '../controller/taste_analysis_scroller_controller.dart';

class AgentSpeechBubble extends StatefulWidget {
  final String message;
  final AgentSpeechBubbleShapeType shape;

  const AgentSpeechBubble(
      {super.key, required this.message, required this.shape});

  @override
  State<AgentSpeechBubble> createState() => _AgentMessageState();
}

class _AgentMessageState extends State<AgentSpeechBubble> {
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
    if(widget.shape == AgentSpeechBubbleShapeType.type1){
      return AgentSpeechBubbleShape(
        message: widget.message,
        topLeft: AgentSpeechBubbleRoundType.big,
        topRight: AgentSpeechBubbleRoundType.big,
        bottomLeft: AgentSpeechBubbleRoundType.small,
        bottomRight: AgentSpeechBubbleRoundType.big,
      );
    } else if (widget.shape == AgentSpeechBubbleShapeType.type2){
      return AgentSpeechBubbleShape(
        message: widget.message,
        topLeft: AgentSpeechBubbleRoundType.small,
        topRight: AgentSpeechBubbleRoundType.big,
        bottomLeft: AgentSpeechBubbleRoundType.small,
        bottomRight: AgentSpeechBubbleRoundType.big,
      );
    } else {
      return AgentSpeechBubbleShape(
        message: widget.message,
        topLeft: AgentSpeechBubbleRoundType.small,
        topRight: AgentSpeechBubbleRoundType.big,
        bottomLeft: AgentSpeechBubbleRoundType.big,
        bottomRight: AgentSpeechBubbleRoundType.big,
      );
    }
  }
}



class AgentSpeechBubbleShape extends StatelessWidget {
  final String message;
  final AgentSpeechBubbleRoundType topLeft;
  final AgentSpeechBubbleRoundType topRight;
  final AgentSpeechBubbleRoundType bottomRight;
  final AgentSpeechBubbleRoundType bottomLeft;

  const AgentSpeechBubbleShape({super.key, required this.message, required, required this.topLeft, required this.topRight, required this.bottomRight, required this.bottomLeft });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffEEEEEE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft.round),
            topRight: Radius.circular(topRight.round),
            bottomRight: Radius.circular(bottomRight.round),
            bottomLeft: Radius.circular(bottomLeft.round),
          )),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        message,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

enum AgentSpeechBubbleRoundType {
  big(17.0),
  small(4.0);

  final double round;

  const AgentSpeechBubbleRoundType(this.round);
}