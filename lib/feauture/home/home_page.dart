import 'package:elingo/data/emotion.dart';
import 'package:elingo/data/repository.dart';
import 'package:elingo/feauture/calendar/calendar.dart';
import 'package:elingo/feauture/home/widgets/custom_button.dart';
import 'package:elingo/feauture/home/widgets/emotions_list.dart';
import 'package:elingo/feauture/home/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;
  DateTime dateAndTime = DateTime.now();
  late int imageIndex;
  void _handleDataChange(int newData) {
    imageIndex = newData;
    if (newData > -1) {
      setState(() {
        selected = true;
      });
    }
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
                      Text(
                        '${dateAndTime.day} ${monthNumberToWord(dateAndTime.month)} ${dateAndTime.hour}:${dateAndTime.minute}',
                        style: const TextStyle(
                            color: Color(0xFFBCBCBF),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CustomCalendar(),
                                ));
                            if (result != null) {
                              setState(() {
                                dateAndTime = result;
                              });
                            }
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
                  CustomSlider(enabled: selected),
                  const Text(
                    'Самооценка',
                    style: TextStyle(
                      color: Color(0xFF4C4C69),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  CustomSlider(enabled: selected),
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
                    onTap: () async {
                      var preferences = await SharedPreferences.getInstance();
                      Repository(preferences).saveEmotion(
                        '15.12.2024',
                        Emotion(imageIndex, 1, 2, 'note'),
                      );
                      var value = await Repository(preferences)
                          .getEmotions('15.12.2024');
                      showDialog(
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(value.toString()),
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
                        context: context,
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

  String monthNumberToWord(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 'января';
      case 2:
        return 'февраля';
      case 3:
        return 'марта';
      case 4:
        return 'апреля';
      case 5:
        return 'мая';
      case 6:
        return 'июня';
      case 7:
        return 'июля';
      case 8:
        return 'августа';
      case 9:
        return 'сентября';
      case 10:
        return 'октября';
      case 11:
        return 'ноября';
      case 12:
        return 'декабря';
      default:
        return 'Неизвестный месяц'; // Agar 1-12 raqami kiritilmasa
    }
  }
}
