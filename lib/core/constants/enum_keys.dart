enum OtmCategory { general, students, teachers, otm }

enum OtmCategoryType { governmental, nongovernmental, foreign, general }

enum TeacherEducationSortCategory {
  withoutRank,
  doctor_dsc,
  candidate_phd,
  none,
}

enum ProfessionalOwnershipCategory {governmental,nogovernmental,foreign,none}
final List<ProfessionalOwnershipCategory> professionalOwnershipCategoryList = [
  ProfessionalOwnershipCategory.none,
  ProfessionalOwnershipCategory.governmental,
  ProfessionalOwnershipCategory.nogovernmental,
  ProfessionalOwnershipCategory.foreign,
];

enum OTMEducationTypeCategory {vocationalschool,college,technicalschool,none}
final List<OTMEducationTypeCategory> professionalEducationTypeCategoryList = [
  OTMEducationTypeCategory.none,
  OTMEducationTypeCategory.vocationalschool,
  OTMEducationTypeCategory.college,
  OTMEducationTypeCategory.technicalschool,
];

enum DoctoralStudiesFilter { general, provinces_section}
List<DoctoralStudiesFilter> doctoralStudiesFilterCategories = [
  DoctoralStudiesFilter.general,
  DoctoralStudiesFilter.provinces_section,
];

enum StudentsFilterCategory {
  education_type,
  education_form,
  payment_form,
  citizenship,
  courses,
  age,
  areas,
  areas_section,
}

List<StudentsFilterCategory> studentsFilterCategories = [
  StudentsFilterCategory.education_type,
  StudentsFilterCategory.education_form,
  StudentsFilterCategory.payment_form,
  StudentsFilterCategory.citizenship,
  StudentsFilterCategory.courses,
  StudentsFilterCategory.age,
  StudentsFilterCategory.areas,
  StudentsFilterCategory.areas_section,
];

enum AcceptanceFilterCategory { Acceptancefrom2021to2024, Acceptance2025 }

List<AcceptanceFilterCategory> acceptanceFilterCategoryList = [
  AcceptanceFilterCategory.Acceptancefrom2021to2024,
  AcceptanceFilterCategory.Acceptance2025,
];

List<OtmCategoryType> otmCategoryList = [
  OtmCategoryType.general,
  OtmCategoryType.governmental,
  OtmCategoryType.nongovernmental,
  OtmCategoryType.foreign,
];
