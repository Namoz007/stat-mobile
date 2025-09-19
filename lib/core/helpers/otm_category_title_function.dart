 import "package:stat_edu_mobile/sources.dart";

Color getTitleColor(OtmCategory currentCategory,OtmCategory blocCategory){
  if(currentCategory == blocCategory){
    return Colors.white;
  }else{
    return AppColors.decorativeColor;
  }
}

Color getCategoryBackgroundColor(OtmCategory currentCategory,OtmCategory blocCategory){
  if(currentCategory == blocCategory){
    return AppColors.decorativeColor;
  }else{
    return Colors.white;
  }
}

OtmCategoryType getOtmTypeWithName(String name){
  switch(name){

    case "Davlat":
      return OtmCategoryType.governmental;

    case "Nodavlat":
      return OtmCategoryType.nongovernmental;

    case "Xorijiy":
      return OtmCategoryType.foreign;

    default:
      return OtmCategoryType.general;
  }
}

OtmCategoryType formatOtmCategoryWithNumber(int index){
  switch(index){
    case 11:
      return OtmCategoryType.governmental;

    case 12:
      return OtmCategoryType.nongovernmental;

    default:
      return OtmCategoryType.foreign;
  }
}

String getOtmCategoryTypeName(OtmCategoryType category){
  switch(category){
    case OtmCategoryType.general:
      return "Jami";

    case OtmCategoryType.governmental:
      return "Davlat";

    case OtmCategoryType.nongovernmental:
      return "Nodavlat";

    default:
      return "Xorijiy";
  }
}

OtmCategoryType changeStatisticCategory(OtmCategoryType selectCategory,bool right) {
  if(right){
    return otmCategoryList[otmCategoryList.indexWhere((value) => value == selectCategory) == otmCategoryList.length - 1 ? 0 : otmCategoryList.indexWhere((value) => value == selectCategory) + 1];
  }else{
    return otmCategoryList[otmCategoryList.indexWhere((value) => value == selectCategory) == 0 ? otmCategoryList.length - 1 : otmCategoryList.indexWhere((value) => value == selectCategory) - 1];
  }
}



int getStatisticCountWithCategory(OtmCategoryType category,List<int> counts){
  return counts[otmCategoryList.indexWhere((value) => value == category)];
}

String getFilterNameWithCategory(StudentsFilterCategory category){
  switch(category){

    case StudentsFilterCategory.education_type:
      return "Ta'lim turi";

    case StudentsFilterCategory.education_form:
      return "Ta'lim shakli";

    case StudentsFilterCategory.payment_form:
      return "To'lov shakli";

    case StudentsFilterCategory.courses:
      return "Kurslar";

    case StudentsFilterCategory.citizenship:
      return "Fuqaroligi";

    case StudentsFilterCategory.age:
      return "Yoshi";

    case StudentsFilterCategory.areas:
      return "Yashash hududi";


    case StudentsFilterCategory.areas_section:
      return "Hududlar kesimida";


    default:
      return '';
  }
}

String formatAgeWithKey(String title){
  if(title == "greaterThan"){
    return "30 yoshdan oshgan";
  }else{
    return "30 yoshdan kichik";
  }
}

String formatPaymentTypeWithKey(String title){
  switch(title){
    case "contract":
      return "To'lov-kontrakt";

    case "grand":
      return "Davlat granti";
    default:
      return title;
  }
}

 int getInstitutionsOwnershipCategory(ProfessionalOwnershipCategory category){
   switch(category){
     case ProfessionalOwnershipCategory.governmental:
       return 11;

     case ProfessionalOwnershipCategory.nogovernmental:
       return 12;

     case ProfessionalOwnershipCategory.foreign:
       return 13;

     default:
       return 0;
   }
 }

 int getProfessionalEducationTypeCategory(OTMEducationTypeCategory category){
  switch(category){

    case OTMEducationTypeCategory.technicalschool:
      return 5;

    case OTMEducationTypeCategory.college:
      return 4;

    default:
      return 0;
  }
 }