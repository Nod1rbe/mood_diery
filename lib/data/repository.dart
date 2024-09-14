import 'dart:convert';

import 'package:elingo/data/emotion.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final SharedPreferences _preferences;

  Repository(this._preferences);

  Future<void> saveEmotion(String date, Emotion emotion) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> existingList = prefs.getStringList(date) ?? [];
    existingList.add(jsonEncode(emotion.toJson()));
    existingList = existingList.toSet().toList();
    await prefs.setStringList(date, existingList);
  }

  Future<List<Emotion>> getEmotions(String key) async {
    return _preferences.getStringList(key)?.map((e) => Emotion.fromJson(jsonDecode(e))).toList() ??
        [];
  }
}
