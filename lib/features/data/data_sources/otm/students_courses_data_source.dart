import 'package:stat_edu_mobile/sources.dart';

class StudentsCoursesDataSource{
  final _dio = getIt<DioFile>().dio;
  
  ///Talabalar/Kurslar talabalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/course/courseAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForCourses(value)));
  }

  ///Talabalar/Kurslar talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsAgeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/course/courseAndAge");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForCourses(value)));
  }

  ///Talabalar/Kurslar talabalar yashash joyi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsResidenceData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/course/courseAndAccomodation");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForCourses(value)));
  }
  
}