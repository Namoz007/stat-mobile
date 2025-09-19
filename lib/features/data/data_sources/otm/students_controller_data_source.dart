import 'package:stat_edu_mobile/sources.dart';

class StudentsControllerDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Talabalar/ta'lim turidagi talabalar soni to'lov shakli bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentPaymentDataEntity>> getStudentsPaymentTypeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/ownershipAndPaymentType");
    return List.from((response.data as List<dynamic>).map((value) => StudentPaymentDataModel.fromJson(value)));
  }

  ///Talabalar/ta'lim turidagi yoshi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentByAgeStatisticEntity>> getStudentsAgeStatisticData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndAge");
    return List.from((response.data as List<dynamic>).map((value) => StudentByAgeStatisticModel.fromJson(value)));
  }

  ///Talabalar/ta'lim turidagi talabalar soni to'lov shaklidagi ma'lumotlar olib kelinyapti
  Future<List<StudentByAgeStatisticEntity>> getStudentsPaymentType() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndPaymentType");
    return List.from((response.data as List<dynamic>).map((value) => StudentByAgeStatisticModel.fromJson(value)));
  }

  ///Talabalar/ta'lim turidagi kurslar bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentByAgeStatisticEntity>> getStudentsCoursesData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndCourse");
    return List.from((response.data as List<dynamic>).map((value) => StudentByAgeStatisticModel.fromJson(value)));
  }
  
  ///Talabalar/talim turidagi fuqaroligi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<StudentByAgeStatisticEntity>> getStudentsCitizenshipData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndCitizenship");
    return List.from((response.data as List<dynamic>).map((value) => StudentByAgeStatisticModel.fromJson(value)));
  }

  ///Talabalar/talim turidagi ta'lim shakli bo'yicha ma'lumotlar olib kelinyapt
  Future<List<StudentByAgeStatisticEntity>> getStudentsOtmEducationData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndEduForm");
    return List.from((response.data as List<dynamic>).map((value) => StudentByAgeStatisticModel.fromJson(value)));
  }

  ///Oliy ta'limdagi umumiy talabalar soni jinisi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<OtmGenderEntity>> getStudentsCountByGender() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/ownershipAndGender");
    return List.from((response.data as List<dynamic>).map((value) => OtmGenderModel.fromJson(value)));
  }

  ///Oliy ta'limdagi talabalr soni ta'lim turi kesimidagi ma'lumotlar olib kelinyaptix
  Future<List<OtmEducationTypeEntity>> getStudentsCountEducationType() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/ownershipAndEduType");
    return List.from((response.data as List<dynamic>).map((value) => OtmEducationTypeModel.fromJson(value)));
  }

  ///Oliy ta'limdagi talabalar soni kurs kesimidagi ma'lumotlar olib kelinyapti
  Future<List<StudentOtmCourseEntity>> getOTMStudentsCourses() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/ownershipAndCourse");
    return List.from((response.data as List<dynamic>).map((value) => StudentsOtmCourseModel.fromJson(value)));
  }
  
  ///Oliy ta'limdagi talablar soni ta'lim shakli kesimida
  Future<List<StudentsEducationFormEntity>> getStudentsEducationFormData() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/ownershipAndEduForm");
    return List.from((response.data as List<dynamic>).map((value) => StudentsEducationFormModel.fromJson(value)));
  }

  Future<List<OTMAreaEntity>> getManyStudentsArea() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/studentAddress");
    return [for(var i in response.data) OTMAreaModel.fromJson(i)];
  }


  Future<List<StudentCourseEntity>> getStudentsEducationTypeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJson(value)));
  }


}