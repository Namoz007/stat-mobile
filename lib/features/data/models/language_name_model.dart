import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class LanguageNameModel extends LanguageNameEntity {
  LanguageNameModel({required super.en, required super.uz, required super.ru});

  factory LanguageNameModel.fromJson(Map<String, dynamic> json) =>
      LanguageNameModel(en: json['en'], uz: json['uz'], ru: json['ru']);
}
