import 'package:stat_edu_mobile/sources.dart';

class StudentPaymentDataModel extends StudentPaymentDataEntity {
  StudentPaymentDataModel({
    required super.ownership,
    required super.grandCount,
    required super.contractCount,
  });

  factory StudentPaymentDataModel.fromJson(Map<String, dynamic> json) =>
      StudentPaymentDataModel(
        ownership: json['ownership'],
        grandCount: json['grandCount'],
        contractCount: json['contractCount'],
      );
}
