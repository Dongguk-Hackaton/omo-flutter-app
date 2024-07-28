import 'package:flutter/material.dart';

class DropdownList extends StatelessWidget {
  const DropdownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 18,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      labelText: '광역시/도',
                    ),
                    value: '경상북도',
                    items: <String>[
                      '강원도',
                      '경기도',
                      '경상남도',
                      '경상북도',
                      '광주광역시',
                      '대구광역시',
                      '대전광역시',
                      '부산광역시',
                      '서울특별시',
                      '세종특별자치시',
                      '울산광역시',
                      '인천광역시',
                      '전라남도',
                      '전라북도',
                      '제주특별자치도',
                      '충청남도',
                      '충청북도',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      labelText: '시/군/구',
                    ),
                    value: '경주시',
                    items: <String>[
                      '경주시',
                      '포항시',
                      '구미시'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}