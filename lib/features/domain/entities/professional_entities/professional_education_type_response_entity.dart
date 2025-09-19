import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class ProfessionalEducationTypeResponseEntity {
  ProfessionalGenderEntity collegeData;
  ProfessionalGenderEntity technicalCollegeData;
  ProfessionalAgeEntity collegeAgeData;
  ProfessionalAgeEntity technicalCollegeAgeData;
  ProfessionalAdmissionTypeEntity collegeAdmissionData;
  ProfessionalAdmissionTypeEntity technicalCollegeAdmissionData;
  ProfessionalCourseEntity collegeCourseData;
  ProfessionalCourseEntity technicalCollegeCourseData;
  ProfessionalCitizenshipEntity collegeCitizenshipData;
  ProfessionalCitizenshipEntity technicalCollegeCitizenshipData;
  ProfessionalResidenceEntity collegeResidenceData;
  ProfessionalResidenceEntity technicalCollegeResidenceData;
  ProfessionalEducationFormEntity collegeEducationFormData;
  ProfessionalEducationFormEntity technicalCollegeEducationFormData;
  bool empty;

  ProfessionalEducationTypeResponseEntity({
    required this.collegeData,
    required this.technicalCollegeData,
    required this.collegeAgeData,
    required this.technicalCollegeAgeData,
    required this.collegeAdmissionData,
    required this.technicalCollegeAdmissionData,
    required this.collegeCourseData,
    required this.technicalCollegeCourseData,
    required this.collegeCitizenshipData,
    required this.technicalCollegeCitizenshipData,
    required this.collegeResidenceData,
    required this.technicalCollegeResidenceData,
    required this.collegeEducationFormData,
    required this.technicalCollegeEducationFormData,
    required this.empty,
  });
}
