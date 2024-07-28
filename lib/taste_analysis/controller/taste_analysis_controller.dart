import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:omo/exception/error_code.dart';
import 'package:omo/exception/not_valid_exception.dart';
import 'package:omo/taste_analysis/const/date_style.dart';
import 'package:omo/taste_analysis/const/interest.dart';
import 'package:omo/taste_analysis/const/taste_state.dart';

import '../const/food.dart';
import '../view/agent_message.dart';

class TasteAnalysisController extends GetxController {
  var currentTasteState = TasteState.activity;

  var widgetList = <Widget>[].obs;

  var dateStyleTasteButtons = _createTasteButtons(DateStyle.values);
  var interestTasteButtons = _createTasteButtons(Interest.values);
  var likeFoodTasteButtons =  _createTasteButtons(Food.values);
  var dislikeFoodTasteButtons =  _createTasteButtons(Food.values);
  var activityInput = TasteNumberInput(-1, false).obs;

  int dateStyleTrueCount = 0;
  int interestTrueCount = 0;
  int likeFoodTrueCount = 0;
  int dislikeFoodTrueCount = 0;

  var tasteStateIndex = 0;
  var tasteStateList = [
    TasteState.activity,
    TasteState.dateStyle,
    TasteState.interest,
    TasteState.likeFood,
    TasteState.dislikeFood
  ];

  @override
  void onInit() {
    super.onInit();
    currentTasteState = tasteStateList[tasteStateIndex];
    widgetList.add(AgentMessage(tasteState: currentTasteState));
  }

  static RxList<Rx<TasteButton>> _createTasteButtons(var tasteValues) {
    RxList<Rx<TasteButton>> buttons = RxList();
    int index = 0;
    for (var value in tasteValues) {
      buttons.add(TasteButton(index++, value.description, false).obs);
    }
    return buttons;
  }

  TasteInput getTasteInput(TasteState tasteState, int buttonId) {
    switch (tasteState) {
      case TasteState.dateStyle:
        return dateStyleTasteButtons[buttonId].value;
      case TasteState.interest:
        return interestTasteButtons[buttonId].value;
      case TasteState.likeFood:
        return likeFoodTasteButtons[buttonId].value;
      case TasteState.dislikeFood:
        return dislikeFoodTasteButtons[buttonId].value;
      case TasteState.activity:
        return activityInput.value;
      default:
        throw ArgumentError('Invalid tasteState value: $tasteState');
    }
  }

  int getLengthOfButton(TasteState tasteState) {
    switch (tasteState) {
      case TasteState.dateStyle:
        return dateStyleTasteButtons.length;
      case TasteState.interest:
        return interestTasteButtons.length;
      case TasteState.likeFood:
        return likeFoodTasteButtons.length;
      case TasteState.dislikeFood:
        return dislikeFoodTasteButtons.length;
      case TasteState.activity:
        throw ArgumentError('Invalid tasteState value: $tasteState');
    }
  }

  String getAllInputData() {
    String dateStyle = dateStyleTasteButtons.map((element) {
      if (element.value._state) {
        return "${element.value.getName()}: ${element.value.getState()}, ";
      }
      return "";
    }).join("");

    String interest = interestTasteButtons.map((element) {
      if (element.value._state) {
        return "${element.value.getName()}: ${element.value.getState()}, ";
      }
      return "";
    }).join("");

    String likeFood = likeFoodTasteButtons.map((element) {
      if (element.value._state) {
        return "${element.value.getName()}: ${element.value.getState()}, ";
      }
      return "";
    }).join("");

    String dislikeFood = dislikeFoodTasteButtons.map((element) {
      if (element.value._state) {
        return "${element.value.getName()}: ${element.value.getState()}, ";
      }
      return "";
    }).join("");

    return dateStyle + interest + likeFood + dislikeFood;
  }

  void updateTasteState() {
    validate();
    if (currentTasteState == TasteState.activity) {
      if (!(activityInput.value._value > 9 || activityInput.value._value < 0)) {
        activityInput.update((value) {
          value?._enabled = false;
        });
      }
    }
    tasteStateIndex++;
    currentTasteState = tasteStateList[tasteStateIndex];
    widgetList.add(AgentMessage(tasteState: currentTasteState));
  }

  void upStateTrueCount(TasteState tasteState) {
    switch (tasteState) {
      case TasteState.dateStyle:
        dateStyleTrueCount++;
        break;
      case TasteState.interest:
        interestTrueCount++;
        break;
      case TasteState.likeFood:
        likeFoodTrueCount++;
        break;
      case TasteState.dislikeFood:
        dislikeFoodTrueCount++;
        break;
      case TasteState.activity:
        break;
    }
  }

  void downStateTrueCount(TasteState tasteState) {
    switch (tasteState) {
      case TasteState.dateStyle:
        dateStyleTrueCount--;
        break;
      case TasteState.interest:
        interestTrueCount--;
        break;
      case TasteState.likeFood:
        likeFoodTrueCount--;
        break;
      case TasteState.dislikeFood:
        dislikeFoodTrueCount--;
        break;
      case TasteState.activity:
        break;
    }
  }

  void validate() {
    if (currentTasteState == TasteState.dateStyle) {
      if (dateStyleTrueCount != 3) {
        throw NotValidException(ErrorCode.invalidDateStyleSelection);
      }
    }
    if (currentTasteState == TasteState.interest) {
      if (interestTrueCount != 3) {
        throw NotValidException(ErrorCode.invalidInterestSelection);
      }
    }

    if (currentTasteState == TasteState.likeFood) {
      if (likeFoodTrueCount != 3) {
        throw NotValidException(ErrorCode.invalidLikeFoodSelection);
      }
    }

    if (currentTasteState == TasteState.dislikeFood) {
      if (dislikeFoodTrueCount != 3) {
        throw NotValidException(ErrorCode.invalidDislikeFoodSelection);
      }
    }

    if (currentTasteState == TasteState.activity) {
      if (activityInput.value._value > 9 || activityInput.value._value < 0) {
        throw NotValidException(ErrorCode.invalidActivitySelection);
      }
    }
  }

  void onPressTasteButton(TasteState tasteState, int index) {
    if (tasteState != currentTasteState) {
      return;
    }

    List<Rx<TasteButton>> targetInput = dateStyleTasteButtons;

    if (tasteState == TasteState.dateStyle) {
      targetInput = dateStyleTasteButtons;
    }

    if (tasteState == TasteState.interest) {
      targetInput = interestTasteButtons;
    }

    if (tasteState == TasteState.likeFood) {
      targetInput = likeFoodTasteButtons;
    }

    if (tasteState == TasteState.dislikeFood) {
      targetInput = dislikeFoodTasteButtons;
    }

    if (targetInput[index].value._state) {
      downStateTrueCount(tasteState);
    } else {
      upStateTrueCount(tasteState);
    }

    targetInput[index].update(
      (value) {
        value?._state = !value._state;
      },
    );
  }
}

class TasteInput {
  bool _state; // 상태를 저장하는 필드

  TasteInput(this._state);

  bool getState() {
    return _state;
  }

  void setState(bool status) {
    _state = status;
  }
}

class TasteButton extends TasteInput {
  int _id;
  String _name;

  TasteButton(int id, String name, super.state)
      : _id = id,
        _name = name;

  int getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  void setId(int id) {
    _id = id;
  }

  void setName(String name) {
    _name = name;
  }
}

class TasteNumberInput extends TasteInput {
  int _value;
  bool _enabled;

  TasteNumberInput(int value, super.state)
      : _value = value,
        _enabled = true;

  int getValue() {
    return _value;
  }

  bool getEnabled() {
    return _enabled;
  }

  void setValue(int value) {
    _value = value;
  }

  void setEnabled(bool enabled) {
    _enabled = enabled;
  }
}
