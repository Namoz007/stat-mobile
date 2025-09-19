import 'package:stat_edu_mobile/core/constants/constants.dart';
import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

int otmPageFormat(OtmCategory category) {
  switch (category) {
    case OtmCategory.general:
      return 0;

    case OtmCategory.otm:
      return 3;

    case OtmCategory.students:
      return 1;

    case OtmCategory.teachers:
      return 2;

    default:
      return 0;
  }
}

String getOTMScreenNameWithCategory(OtmCategory category){
  switch(category){
    case OtmCategory.general:
      return "Umumiy";
    case OtmCategory.students:
      return "Talabalar";
    case OtmCategory.teachers:
      return "O'qituvchilar";
    case OtmCategory.otm:
      return "OTMlar";
    default:
      return '';
  }
}

bool universityCubitDataController(
  List<UniversityEntity> universities,
  int id,
) {
  if (universities.indexWhere((value) => value.id == id) != -1) {
    return true;
  }

  return false;
}
