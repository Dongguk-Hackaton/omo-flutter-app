import 'package:flutter/material.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  int _startHour = 9;
  int _endHour = 19;

  List<DropdownMenuItem<int>> _buildDropdownMenuItems(int selectedHour, bool isStartTime) {
    return List<DropdownMenuItem<int>>.generate(24, (int index) {
      bool isDisabled;
      if (isStartTime) {
        isDisabled = index >= _endHour;
      } else {
        isDisabled = index <= _startHour;
      }
      return DropdownMenuItem<int>(
        value: index,
        enabled: !isDisabled,
        child: Text(
          '$index시',
          style: TextStyle(
            color: isDisabled ? Colors.grey : Colors.black,
          ),
        ),
      );
    });
  }

  Widget _buildDropdownButton(int selectedHour, bool isStartTime) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff7d848d)),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DropdownButton<int>(
        value: selectedHour,
        isDense: true,
        underline: SizedBox.shrink(),
        items: _buildDropdownMenuItems(selectedHour, isStartTime),
        onChanged: (int? newValue) {
          if (newValue != null) {
            setState(() {
              if (isStartTime) {
                _startHour = newValue;
              } else {
                _endHour = newValue;
              }
            });
          }
        },
        selectedItemBuilder: (BuildContext context) {
          return _buildDropdownMenuItems(selectedHour, isStartTime).map((item) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                '${item.value}시',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '⏰ 데이트 시간 지정',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2),
          Text(
            '데이트 시간을 지정해주세요',
            style: TextStyle(
              color: Color(0xFF7D848D),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text.rich(TextSpan(text: "시작 시간",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))),
              SizedBox(width: 15),
              _buildDropdownButton(_startHour, true),
              SizedBox(width: 15),
              Text.rich(TextSpan(text: "종료 시간",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))),
              SizedBox(width: 15),
              _buildDropdownButton(_endHour, false),
            ],
          ),
        ],
      ),
    );
  }
}
