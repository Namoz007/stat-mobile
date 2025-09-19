import "package:stat_edu_mobile/sources.dart";

TeacherEducationSortCategory convertTeacherCategoryFromString(String category) {
  switch (category) {
    case "Darajasiz":
      return TeacherEducationSortCategory.withoutRank;

    case "Fan doktori, DSc":
      return TeacherEducationSortCategory.doctor_dsc;

    case "Fan nomzodi, PhD":
      return TeacherEducationSortCategory.candidate_phd;

    default:
      return TeacherEducationSortCategory.none;
  }
}

String getDoctoralStudiesCategoryWithKey(DoctoralStudiesFilter category){

  switch(category){
    case DoctoralStudiesFilter.general:
      return "Umumiy";

    case DoctoralStudiesFilter.provinces_section:
      return "Viloyatlar kesimida";

    default:
      return '';
  }

}

OtmCategory getOtmTitleCategoryIndex(int index) {
  switch(index){

  case 0:
  return OtmCategory.general;

  case 1:
  return OtmCategory.students;

  case 2:
  return OtmCategory.teachers;

  case 3:
  return OtmCategory.otm;

    default:
      return OtmCategory.general;
  }
}

String getProfessionalInstitutionCategoryName(ProfessionalOwnershipCategory category){
  switch(category){

    case ProfessionalOwnershipCategory.none:
      return "Mulkchilik shakli";

    case ProfessionalOwnershipCategory.governmental:
      return "Davlat";

    case ProfessionalOwnershipCategory.nogovernmental:
      return "Nodavlat";

    case ProfessionalOwnershipCategory.foreign:
      return "Xorijiy";

    default:
      return '';
  }
}

String getEducationTypeCategoryName(OTMEducationTypeCategory category){
  switch(category){

    case OTMEducationTypeCategory.none:
      return "Ta'lim turi";

    case OTMEducationTypeCategory.vocationalschool:
      return "Kasb-hunar maktabi";

    case OTMEducationTypeCategory.technicalschool:
      return "Texnikum";

    case OTMEducationTypeCategory.college:
      return "Kollej";

    default:
      return "";
  }
}
