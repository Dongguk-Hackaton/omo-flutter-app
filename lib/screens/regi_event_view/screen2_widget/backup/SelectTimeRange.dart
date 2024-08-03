import 'package:flutter/material.dart';
// import 'activity.dart';

class SelectTimeRange extends StatelessWidget {
  final int startTime;
  final int endTime;
  final Function(int) onStartTimeChanged;
  final Function(int) onEndTimeChanged;

  SelectTimeRange({
    required this.startTime,
    required this.endTime,
    required this.onStartTimeChanged,
    required this.onEndTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<int>(
            value: startTime,
            items: List.generate(24, (index) => DropdownMenuItem(value: index, child: Text('$index시'))),
            onChanged: (value) {
              onStartTimeChanged(value!);
            },
          ),
          Text(' - '),
          DropdownButton<int>(
            value: endTime,
            items: List.generate(24, (index) => DropdownMenuItem(value: index, child: Text('$index시'))),
            onChanged: (value) {
              onEndTimeChanged(value!);
            },
          ),
        ],
      ),
    );
  }
}