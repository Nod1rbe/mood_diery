import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            icon: const Icon(Icons.book, color: Colors.white),
            label: const Text(
              'Дневник настроения',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            icon: const Icon(Icons.bar_chart, color: Colors.grey),
            label: const Text(
              'Статистика',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomButton(),
  ));
}
