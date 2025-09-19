import 'package:stat_edu_mobile/sources.dart';

class ProfessionalPaymentFormResponseModel
    extends ProfessionalPaymentFormResponseEntity {
  ProfessionalPaymentFormResponseModel({
    required super.genderData,
    required super.ageData,
    required super.courseData,
    required super.citizenshipData,
    required super.residenceData,
    required super.empty,
  });

  factory ProfessionalPaymentFormResponseModel.empty() =>
      ProfessionalPaymentFormResponseModel(
        genderData: [],
        ageData: [],
        courseData: [],
        citizenshipData: [],
        residenceData: [],
        empty: true,
      );

  factory ProfessionalPaymentFormResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ProfessionalPaymentFormResponseModel(
    genderData: List.from(
      json['by_gender'].map((value) => ProfessionalGenderModel.fromJsonForPayment(value)),
    ),
    ageData: List.from(
      json['by_age'].map((value) => ProfessionalAgeModel.fromJsonForPayment(value)),
    ),
    courseData: List.from(
      json['by_course'].map((value) => ProfessionalCourseModel.fromJsonForPayment(value)),
    ),
    citizenshipData: List.from(
      json['by_citizenship'].map((value) => ProfessionalCitizenshipModel.fromJsonForPayment(value)),
    ),
    residenceData: List.from(
      json['by_current_live_place'].map((value) => ProfessionalResidenceModel.fromJsonForPayment(value)),
    ),
    empty: false,
  );

}
