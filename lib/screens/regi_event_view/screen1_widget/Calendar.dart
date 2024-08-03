import 'package:flutter/material.dart';
import 'package:omo/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeSelector extends StatefulWidget {
  final Function(DateTimeRange)? onRangeSelected;

  const DateRangeSelector({Key? key, this.onRangeSelected}) : super(key: key);

  @override
  _DateRangeSelectorState createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateRangePickerController _controller = DateRangePickerController();
  DateTime? _startDate;
  DateTime? _endDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        _startDate = args.value.startDate;
        _endDate = args.value.endDate;
      });

      if (_startDate != null && _endDate != null && widget.onRangeSelected != null) {
        widget.onRangeSelected!(DateTimeRange(start: _startDate!, end: _endDate!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12), // 캘린더 전체 모서리 반경 설정
          ),
          child: SfDateRangePicker(
            backgroundColor: Colors.transparent, // 배경색 투명 설정
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: _onSelectionChanged,
            controller: _controller,
            showNavigationArrow: false, // 헤더의 화살표 비활성화
            headerStyle: DateRangePickerHeaderStyle(
              textStyle: TextStyle(
                color: Colors.black, // 타이틀 텍스트 색상 변경
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.white,
            ),
            monthViewSettings: DateRangePickerMonthViewSettings(
              dayFormat: 'EEE', // 요일 텍스트 형식 설정
            ),
            selectionShape: DateRangePickerSelectionShape.circle,
            selectionRadius: 15,
            startRangeSelectionColor: omoBlue,
            endRangeSelectionColor: omoBlue,
            rangeSelectionColor: omoBlue.withOpacity(0.5),
            rangeTextStyle: TextStyle(color: Colors.white),
            selectionTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        if (_startDate != null && _endDate != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Range: ${_startDate!.toLocal()} - ${_endDate!.toLocal()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}