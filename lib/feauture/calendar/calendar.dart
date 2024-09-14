import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, _selectedDay);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pop(context, _selectedDay);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF8702),
                    borderRadius: BorderRadius.all(
                      Radius.circular(69),
                    ),
                  ),
                  width: double.infinity,
                  child: const Center(
                      child: Text(
                    'Ok',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF)),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
