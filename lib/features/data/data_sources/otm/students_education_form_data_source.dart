import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationFormDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Talbalar/ta'lim shakli jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduForm/educationFormAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForGender(value)));
  }


  Future<List<StudentCourseEntity>> getStudentsAgeByEducationForm() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduForm/educationFormAndAge");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForGender(value)));
  }

  Future<List<StudentCourseEntity>> getStudentsCitizenshipData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduForm/educationFormAndCitizenship");
    return [for(int i = 0;i < response.data.length;i++) StudentCourseModel.fromJsonForGender(response.data[i])].reversed.toList();
    // return List.from(response.data.where((value) => StudentCourseModel.fromJsonForGender(value)));
  }

  ///Talabalar/ta'lim shakli to'lov turi ma'lumotlari
  Future<List<StudentCourseEntity>> getStudentsEducationPaymentType() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduForm/educationFormAndPaymentForm");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForGender(value)));
  }

  ///Talabalar/ta'lim shakli kurslar bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsEducationCourses() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduForm/educationFormAndCourse");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForGender(value)));
  }

  ///Talabalar/ta'lim shakli yashs joyi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsEducationResidenceArea() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduForm/educationFormAndAccommodation");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForGender(value)).toList());
  }
}