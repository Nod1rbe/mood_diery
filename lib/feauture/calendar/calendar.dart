import 'package:flutter/material.dart';

class YearlyCalendarScreen extends StatefulWidget {
  const YearlyCalendarScreen({super.key});

  @override
  _YearlyCalendarScreenState createState() => _YearlyCalendarScreenState();
}

class _YearlyCalendarScreenState extends State<YearlyCalendarScreen> {
  final List<String> months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Color(0xFFBCBCBF),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Сегодня',
              style: TextStyle(color: Color(0xFFBCBCBF)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Text('2024',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 1.5,
                ),
                itemCount: months.length,
                itemBuilder: (context, monthIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          months[monthIndex],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: DateTime(2024, monthIndex + 2, 0).day,
                        itemBuilder: (context, dayIndex) {
                          DateTime currentDate =
                              DateTime(2024, monthIndex + 1, dayIndex + 1);
                          bool isSelected = selectedDate == currentDate;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedDate = null;
                                } else {
                                  selectedDate = currentDate;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: isSelected
                                    ? Colors.orange.shade100
                                    : Colors.white,
                              ),
                              child: Text(
                                '${dayIndex + 1}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF4C4C69),
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
