import 'package:stat_edu_mobile/sources.dart';

class OtmControllerDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Oliy ta'limdagi barcha universitetlar ma'lumotlari olib kelinyapti
  Future<List<UniversityEntity>> getOtmDataList() async{
    final response = await _dio.get('https://prof-emis.edu.uz/api/v2/integration/stat/public/university?limit=10000');
    return List.from((response.data as List<dynamic>).map((value) => UniversityModel.fromJson(value)));
  }

  ///Oliy ta'limdagi barcha professor va o'qituvchilar ma'lumotlari olib kelinyapti
  Future<List<OtmGenderEntity>> getProfessorsGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/teacher/ownershipAndGender");
    return List.from((response.data as List<dynamic>).map((value) => OtmGenderModel.fromJson(value)));
  }


  ///Oliy ta'limdagi otmlar tashkiliy turi bo'yicha sonini olib kelyapti
  Future<List<OtmUniversityTypeEntity>> getOTMCountWithOrganizationalType() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/university/universityType");
    return List.from((response.data as List<dynamic>).map((value) => OtmUniversityTypeModel.fromJson(value)));
  }

  ///Oliy ta'limdagi barcha ta'labalar soni olib kelinyapti
  Future<List<StudentCourseEntity>> getStudentsCountWithAcademicDegreeData() async{
    final response = await _dio.get("https://stat.edu.uz/api/student/statistic/eduType/eduTypeAndGender");
    return List.from((response.data as List<dynamic>).map((value) => StudentCourseModel.fromJson(value)));
  }

  ///Oliy ta'limdagi talabalar OTM joylashgan joyi bo'yicha
  Future<List<OTMAreaEntity>> getCountryOTMWithArea() async{
    final response = await _dio.get('https://stat.edu.uz/api/statistic/common/student/universityAddress');
    return List.from((response.data as List<dynamic>).map((value) => OTMAreaModel.fromJson(value)));
  }

  ///Oliy ta'limdagi eng ko'p talabarga ega top 5 universitet ma'lumotlari olib kelinyapti
  Future<List<TopUniversityEntity>> topFiveManyStudentsUniversities() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/student/topFiveUniversity");
    return [for(var i in response.data) TopUniversityModel.fromJson(i)].reversed.toList();
  }


}