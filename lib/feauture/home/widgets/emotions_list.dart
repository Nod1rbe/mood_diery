import 'package:flutter/material.dart';

class EmotionsList extends StatefulWidget {
  final ValueChanged<int> onDataChanged;
  const EmotionsList({super.key, required this.onDataChanged});

  @override
  State<EmotionsList> createState() => _EmotionsListState();
}

class _EmotionsListState extends State<EmotionsList> {
  List<String> emotions = [
    'assets/images/radost.png',
    'assets/images/ctrax.png',
    'assets/images/beshenstvo.png',
    'assets/images/grust.png',
    'assets/images/cpakoistva.png',
    'assets/images/cila.png',
  ];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          6,
          (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onDataChanged(selectedIndex);
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15, top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(76)),
                  border: isSelected
                      ? Border.all(
                          color: const Color(0xFFFF8702),
                          width: 2,
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(10, 0),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(
                    top: 23, bottom: 45, left: 15, right: 15),
                child: Image.asset(emotions[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
