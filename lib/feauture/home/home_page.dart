import 'dart:developer';

import 'package:elingo/feauture/calendar/calendar.dart';
import 'package:elingo/feauture/home/widgets/custom_button.dart';
import 'package:elingo/feauture/home/widgets/emotions_list.dart';
import 'package:elingo/feauture/home/widgets/indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;

  int _receivedData = -2;

  void _handleDataChange(int newData) {
    setState(() {
      _receivedData = newData;
    });
  }

  @override
  void initState() {
    _handleDataChange;
    if (_receivedData > -1) {
      selected = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(),
                      const Text(
                        '1-january 09:00',
                        style: TextStyle(
                            color: Color(0xFFBCBCBF),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        YearlyCalendarScreen(),
                                  ));
                            });
                          },
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFFBCBCBF),
                          ))
                    ],
                  ),
                  CustomButton(),
                  const Text(
                    'Что чувствуешь?',
                    style: TextStyle(
                      color: Color(0xFF4C4C69),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  EmotionsList(
                    onDataChanged: _handleDataChange,
                  ),
                  const Text(
                    'Уровень стресса',
                    style: TextStyle(
                      color: Color(0xFF4C4C69),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SliderExample(enabled: selected),
                  const Text(
                    'Самооценка',
                    style: TextStyle(
                      color: Color(0xFF4C4C69),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SliderExample(enabled: selected),
                  const Text(
                    'Заметки',
                    style: TextStyle(
                      color: Color(0xFF4C4C69),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Введите заметку',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFFBCBCBF)),
                        border: InputBorder.none,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        log(_receivedData.toString());
                      });
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('все ок'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
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
                        'Сохранить',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF)),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
