import 'package:stat_edu_mobile/sources.dart';

class StudentsAgeResidenceDataSource{

  final _dio = getIt<DioFile>().dio;

  ///Talabalar/Yoshi talbalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/age/ageAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForAge(value)));
  }

  ///Talabalar/Yoshi talbalar yashash joyi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsResidenceData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/age/ageAndAccomodation");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForAge(value)));
  }

  ///Talabalar/Yashash joyi talbalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsResidenceForResidenceTypeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/accommodation/accommodationAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForResidenceType(value)));
  }

}