class DataModal {
  final int id;
  final int chapterNumber;
  final int versesCount;
  final String name;
  final String nameMeaning;
  final String nameTranslation;
  final String chapterSummary;
  final String chapterSummaryHindi;
  DataModal({
    required this.id,
    required this.chapterNumber,
    required this.versesCount,
    required this.name,
    required this.nameMeaning,
    required this.nameTranslation,
    required this.chapterSummary,
    required this.chapterSummaryHindi,

  });
}

class IsLangModel {
  bool isLang;

  IsLangModel({
    required this.isLang,

  });
}

class ThemeModel {
  bool isLight;

  ThemeModel({
    required this.isLight,
  });
}
