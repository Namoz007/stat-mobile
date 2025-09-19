import 'package:stat_edu_mobile/sources.dart';
class StudentsPaymentFormDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Talabalar/To'lov shakli talabalar turar joyi boyicha malumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsResidenceData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/paymentType/paymentTypeAndAccommodation");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForPaymentForm(value)));
  }

  ///Talabalar/To'lov shakli talabalar jinsi boyicha olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/paymentType/paymentTypeAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForPaymentForm(value)));
  }

  ///Talbalar/To'lov shakli yoshi bo'yicha malumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsAgeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/paymentType/paymentTypeAndAge");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForPaymentForm(value)));
  }

  ///Talabalar/To'lov shakli fuqaroligi boyicha malumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsPaymentFormCitizenshipData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/paymentType/paymentTypeAndCitizenship");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForPaymentForm(value)));
  }

  ///Talabalar/To'lov shakli fuqaroligi bocyiha malumotlar olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsCoursesData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/paymentType/paymentTypeAndCourse");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJsonForPaymentForm(value)));
  }
}