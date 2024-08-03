import 'package:flutter/material.dart';
// import 'activity.dart';  // 이 줄 추가

class SelectTimeBlock extends StatelessWidget {
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  SelectTimeBlock({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.green)),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: ['다이나믹', '놀기', '술', '보기', '걷기', '마시기', '먹기', '체험']
            .map((category) => ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (bool selected) {
                    onCategorySelected(category);
                  },
                  selectedColor: Colors.blue, // 활성화된 칩 색상
                  backgroundColor: Colors.grey, // 비활성화된 칩 색상
                  labelStyle: TextStyle(color: Colors.white),
                ))
            .toList(),
      ),
    );
  }
}