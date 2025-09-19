import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Talabalar/Hududlar_kesimida talabalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndGender");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar ta'lim turi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsEducationTypeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndEduType");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsAgeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndAge");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar to'lov turi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsPaymentFormData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndPaymentType");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar kurslar bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsCoursesData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndCourse");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar fuqaroligi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsCitizenshipData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndCitizenship");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar yashash joyi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsResidenceData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndAccommodation");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

  ///Talabalar/Hududlar_kesimida talabalar ta'lim shakli bo'yicha ma'lumotlar olib kelinyapti
  Future<List<RegionDataEntity>> getStudentsEducationFormData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/region/regionAndEduForm");
    return List.from((response.data as List<dynamic>).map((value) => RegionDataModel.fromJson(value)));
  }

}