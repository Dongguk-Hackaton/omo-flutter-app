import 'package:flutter/material.dart';
import 'package:omo/colors.dart';

class Previewmap extends StatelessWidget {
  const Previewmap({Key? key});

  @override
  Widget build(BuildContext context) {
    double DeviceW_90 = MediaQuery.of(context).size.width * 0.9;
    return Center(
      child: Container(
      width: DeviceW_90,
      height: DeviceW_90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
        color: omoDeepPink, 
        ),
        child: Text('지도 미리보기', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      ),
    );
  }
}