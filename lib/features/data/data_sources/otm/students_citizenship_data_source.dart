import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Talabalar/Fuqaroligi talabalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/citizenship/citizenshipAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForCitizenship(value)));
  }

  ///Talbalar/Fuqaroligi talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsAgeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/citizenship/citizenshipAndAge");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForCitizenship(value)));
  }

  ///Talabalar/Fuqaroligi talbalar kurslar bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsCourses() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/citizenship/citizenshipAndCourse");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForCitizenship(value)));
  }
}