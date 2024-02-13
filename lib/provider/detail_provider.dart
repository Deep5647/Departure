import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/data_modal.dart';

class DataProvider extends ChangeNotifier {
  List<DataModal> newData = [];

  IsLangModel isLangModel = IsLangModel(isLang: false);


  ThemeModel themeModel = ThemeModel(isLight: false);


  Future<void> getGeetaData() async {
    String getData = await rootBundle.loadString('assets/json/geeta_data.json');
    Map geeta = jsonDecode(getData);
    List<dynamic> allData = geeta["geeta"];
    newData = allData
        .map(
          (e) => DataModal(
            id: e['id'],
            chapterNumber: e['chapter_number'],
            versesCount: e['verses_count'],
            name: e['name'],
            nameMeaning: e['name_meaning'],
            nameTranslation: e['name_translation'],
            chapterSummary: e['chapter_summary'],
            chapterSummaryHindi: e['chapter_summary_hindi'],
          ),
        )
        .toList();



    notifyListeners();
  }


  void changeTheme() {
    themeModel.isLight = !themeModel.isLight;
    notifyListeners();
  }
  void changeLang() {
    isLangModel.isLang = !isLangModel.isLang;
    notifyListeners();
  }



}
