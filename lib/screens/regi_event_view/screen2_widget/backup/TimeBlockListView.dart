// import 'package:flutter/material.dart';
// import 'activity.dart';

// class TimeBlockListView extends StatelessWidget {
//   final List<Activity> scheduledActivities;
//   final Function(int, int) onReorder;
//   final int startTime;  // 추가
//   final int endTime;    // 추가

//   TimeBlockListView({
//     required this.scheduledActivities,
//     required this.onReorder,
//     required this.startTime,  // 추가
//     required this.endTime,    // 추가
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(border: Border.all(color: Colors.purple)),
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: ReorderableListView(
//                 onReorder: onReorder,
//                 padding: EdgeInsets.only(right: 50),
//                 children: List.generate(scheduledActivities.length, (index) {
//                   final activity = scheduledActivities[index];
//                   return Container(
//                     key: ValueKey(activity),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black),
//                       color: Colors.blue,
//                     ),
//                     height: 20.0 * activity.duration, // 시간에 따라 높이 설정, 1시간당 20px
//                     child: Center(child: Text('${activity.category} (${activity.duration}시간)')),
//                   );
//                 }),
//               ),
//             ),
//             Positioned(
//               right: 0,
//               top: 0,
//               bottom: 0,
//               child: CustomPaint(
//                 size: Size(40, double.infinity),
//                 painter: TimeTickPainter(
//                   startTime: startTime,  // 부모 위젯에서 startTime 받아옴
//                   endTime: endTime,      // 부모 위젯에서 endTime 받아옴
//                   totalDuration: endTime - startTime,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TimeTickPainter extends CustomPainter {
//   final int startTime;
//   final int endTime;
//   final int totalDuration;

//   TimeTickPainter({
//     required this.startTime,
//     required this.endTime,
//     required this.totalDuration,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double tickSpacing = 20.0; // 시간 간격 20px

//     for (int i = 0; i <= totalDuration; i++) {
//       final double y = i * tickSpacing;
//       TextSpan span = TextSpan(
//         style: TextStyle(color: Colors.black),
//         text: '${startTime + i}시',
//       );
//       TextPainter tp = TextPainter(
//         text: span,
//         textAlign: TextAlign.left,
//         textDirection: TextDirection.ltr,
//       );
//       tp.layout();
//       tp.paint(canvas, Offset(5, y - 7));
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }