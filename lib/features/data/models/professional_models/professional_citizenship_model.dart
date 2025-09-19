import 'package:stat_edu_mobile/features/domain/entities/professional_entities/professional_citizenship_entity.dart';

class ProfessionalCitizenshipModel extends ProfessionalCitizenshipEntity {
  ProfessionalCitizenshipModel({
    required super.countyCitizenshipCount,
    required super.foreignCitizenshipCount,
    required super.notCitizenshipCount,
    required super.minorCount,
    required super.education_type,
    required super.empty,
  });

  factory ProfessionalCitizenshipModel.empty() => ProfessionalCitizenshipModel(countyCitizenshipCount: 0, foreignCitizenshipCount: 0, notCitizenshipCount: 0, minorCount: 0,education_type: '', empty: true,);

  factory ProfessionalCitizenshipModel.fromJsonForArea(Map<String,dynamic> json) => ProfessionalCitizenshipModel(countyCitizenshipCount: json['11'], foreignCitizenshipCount: json['12'], notCitizenshipCount: json['13'], minorCount: json['14'],education_type: json['region'].toString(), empty: false);

  factory ProfessionalCitizenshipModel.fromJson(Map<String,dynamic> json) => ProfessionalCitizenshipModel(countyCitizenshipCount: json['11'], foreignCitizenshipCount: json['12'], notCitizenshipCount: json['13'], minorCount: json['14'],education_type: json['education_type'].toString(), empty: false);

  factory ProfessionalCitizenshipModel.fromJsonForPayment(Map<String,dynamic> json) => ProfessionalCitizenshipModel(countyCitizenshipCount: json['11'], foreignCitizenshipCount: json['12'], notCitizenshipCount: json['13'], minorCount: json['14'],education_type: json['admission_type'].toString(), empty: false);

}
