import 'package:flutter/material.dart';

class TravelCategorySelector extends StatefulWidget {
  @override
  _TravelCategorySelectorState createState() => _TravelCategorySelectorState();
}

class _TravelCategorySelectorState extends State<TravelCategorySelector> {
  final List<String> categories = [
    '🪂다이나믹', '❤️놀기', '🍻술', '🏞️보기', '🚶🏻걷기', '☕️마시기', '🍽️먹기', '🎨체험'
  ];
  final Map<String, Color> categoryColors = {
    '🪂다이나믹': Colors.teal,
    '❤️놀기': Colors.redAccent,
    '🍻술': Colors.orangeAccent,
    '🏞️보기': Colors.lightBlue,
    '🚶🏻걷기': Colors.blue,
    '☕️마시기': Colors.brown,
    '🍽️먹기': Colors.blueAccent,
    '🎨체험': Colors.indigo,
  };
  String selectedCategory = '🪂다이나믹';
  int selectedDuration = 1;
  List<Block> blocks = [];
  int startval = 8;
  int endval = 15;
  int? draggingIndex;
  int? hoverIndex;

  bool get canAddBlock {
    int currentTotalDuration = blocks.fold(0, (sum, block) => sum + block.duration);
    int availableTime = endval - startval;
    return currentTotalDuration + selectedDuration <= availableTime;
  }

  bool get canRemoveBlock {
    return blocks.isNotEmpty;
  }

  void _increaseDuration() {
    setState(() {
      selectedDuration++;
    });
  }

  void _decreaseDuration() {
    setState(() {
      if (selectedDuration > 1) {
        selectedDuration--;
      }
    });
  }

  void _updateState() {
    setState(() {});
  }

  void _removeLastBlock() {
    setState(() {
      if (blocks.isNotEmpty) {
        blocks.removeLast();
      }
    });
  }

  void _onBlockReordered(int oldIndex, int newIndex) {
    setState(() {
      final Block block = blocks.removeAt(oldIndex);
      blocks.insert(newIndex, block);
      draggingIndex = null;
      hoverIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    int availableTime = endval - startval;
    double totalWidth = MediaQuery.of(context).size.width - 16; // Adjust for padding/margin
    double blockHeight = 50.0; // Set the block height explicitly

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: categories.map((category) {
            bool isSelected = selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? categoryColors[category] : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _decreaseDuration();
                _updateState();
              },
              icon: Icon(Icons.remove),
            ),
            Text('$selectedDuration 시간', style: TextStyle(fontSize: 16)),
            IconButton(
              onPressed: () {
                _increaseDuration();
                _updateState();
              },
              icon: Icon(Icons.add),
            ),
            Spacer(),
            GestureDetector(
              onTap: canRemoveBlock ? _removeLastBlock : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: canRemoveBlock ? Colors.white : Colors.grey,
                  border: Border.all(
                    color: canRemoveBlock ? Colors.black : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '삭제',
                  style: TextStyle(
                    color: canRemoveBlock ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: canAddBlock
                  ? () {
                      setState(() {
                        blocks.add(Block(category: selectedCategory, duration: selectedDuration));
                      });
                    }
                  : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: canAddBlock ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '추가',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          width: double.maxFinite,
          height: blockHeight + 16, // Adjust height to match block height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFEBF0F5),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 4, right: 4),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(blocks.length + 1, (index) {
                final block = index < blocks.length ? blocks[index] : null;
                double blockWidth = block != null ? (block.duration / availableTime) * totalWidth : 0;

                return LongPressDraggable<int>(
                  data: index,
                  child: DragTarget<int>(
                    onAccept: (oldIndex) {
                      if (block == null) {
                        _onBlockReordered(oldIndex, blocks.length);
                      } else {
                        _onBlockReordered(oldIndex, index);
                      }
                    },
                    onWillAccept: (data) {
                      setState(() {
                        hoverIndex = index;
                      });
                      return true;
                    },
                    onLeave: (data) {
                      setState(() {
                        hoverIndex = null;
                      });
                    },
                    builder: (context, candidateData, rejectedData) {
                      bool isHovering = hoverIndex == index;
                      bool isDragging = draggingIndex == index;
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: isHovering && block != null
                            ? (blocks[draggingIndex!].duration / availableTime) * totalWidth
                            : blockWidth,
                        height: blockHeight,
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        decoration: BoxDecoration(
                          color: isDragging ? Colors.transparent : categoryColors[block?.category ?? ''],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: block != null
                            ? Center(
                                child: Text(
                                  block.category,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                                ),
                              )
                            : Container(), // Empty container for the last drag target
                      );
                    },
                  ),
                  feedback: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: blockWidth,
                      height: blockHeight,
                      decoration: BoxDecoration(
                        color: categoryColors[block?.category]?.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 4),
                      child: Center(
                        child: Text(
                          block?.category ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(
                    width: blockWidth,
                    height: blockHeight,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    margin: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 4),
                  ),
                  onDragStarted: () {
                    setState(() {
                      draggingIndex = index;
                    });
                  },
                  onDragEnd: (details) {
                    setState(() {
                      draggingIndex = null;
                      hoverIndex = null;
                    });
                  },
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class Block {
  final String category;
  final int duration;

  Block({required this.category, required this.duration});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Block &&
        other.category == category &&
        other.duration == duration;
  }

  @override
  int get hashCode => category.hashCode ^ duration.hashCode;
}
