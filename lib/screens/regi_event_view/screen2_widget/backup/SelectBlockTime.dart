import 'package:flutter/material.dart';
// import 'activity.dart';

class SelectBlockTime extends StatelessWidget {
  final int? selectedDuration;
  final void Function(int?) onDurationSelected;
  final void Function() onAddActivity;
  final void Function() onCancel;

  SelectBlockTime({
    required this.selectedDuration,
    required this.onDurationSelected,
    required this.onAddActivity,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          child: DropdownButton<int>(
            value: selectedDuration,
            items: [1, 2, 3, 4, 5].map((duration) => DropdownMenuItem(value: duration, child: Text('$duration시간'))).toList(),
            onChanged: onDurationSelected,
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onAddActivity, child: Text('추가')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: onCancel, child: Text('취소')),
            ],
          ),
        ),
      ],
    );
  }
}