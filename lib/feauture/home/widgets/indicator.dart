import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  bool enabled;
  SliderExample({super.key, required this.enabled});

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(10, 0),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor:
                    widget.enabled ? Colors.orange : Colors.grey[300],
                inactiveTrackColor: Colors.grey[300],
                trackHeight: 8.0,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 12.0,
                  elevation: 5,
                ),
                overlayColor: Colors.orange.withOpacity(0.2),
                thumbColor: widget.enabled ? Colors.orange : Colors.grey,
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 30.0,
                ),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor:
                    widget.enabled ? Colors.grey : Colors.grey[400],
                inactiveTickMarkColor: Colors.grey[400],
              ),
              child: Slider(
                value: _currentValue,
                min: 0,
                max: 1,
                divisions: 4,
                onChanged: widget.enabled
                    ? (value) {
                        setState(() {
                          _currentValue = value;
                        });
                      }
                    : null, // Agar null bo'lsa, slider ishlamaydi
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Низкий', // Past
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Высокий', // Yuqori
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Sliderni yoqish yoki o'chirish uchun tugma
          ],
        ),
      ),
    );
  }
}
