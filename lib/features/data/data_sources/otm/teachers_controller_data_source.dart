import 'package:stat_edu_mobile/sources.dart';

class TeachersControllerDataSource{
  final _dio = getIt<DioFile>().dio;

  ///O'qituvchilar rahbalar bo'yicha ma'lumotlar olib kelinyapti
  Future<List<TeacherLeaderEntity>> getTeachersLeaderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/chiefPosition");
    return List.from(response.data.map((value) => TeacherLeaderModel.fromJson(value)));
  }

  ///O'qituvchilar jinsi bo'yicha ma'lumotlar olib kelinyapti
  Future<List<TeacherLeaderEntity>> getTeachersGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/gender");
    return List.from((response.data as List<dynamic>).map((value) => TeacherLeaderModel.fromJson(value)));
  }

  ///O'qituvchilar ilmiy daraja bo'yicha ma'lumotlar olib kelinyapti
  Future<List<TeacherPositionEntity>> getTeachersEducationRankData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/academicDegree");
    return List.from((response.data as List<dynamic>).map((value) => TeacherPositionModel.fromJson(value)));
  }

  ///O'qituvchilar ilmiy unvon bo'yicha ma'lumotlar olib kelinyapti
  Future<List<TeacherPositionEntity>> getTeachersPositionData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/academicRank");
    return List.from((response.data as List<dynamic>).map((value) => TeacherPositionModel.fromJson(value)));
  }
  
  ///O'qituvchilar lavozim bo'yicha ma'lumotlar olib kelinaypti
  Future<List<TeacherLeaderEntity>> getPositionStatisticData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/position");
    return List.from((response.data as List<dynamic>).map((value) => TeacherLeaderModel.fromJson(value)));
  }

  ///O'qituvchilar mehnat shakli bo'yicha ma'lumotlar olib kelinyapti
  Future<List<TeacherLeaderEntity>> getLaborFormData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/employeeForm");
    return List.from((response.data as List<dynamic>).map((value) => TeacherLeaderModel.fromJson(value)));
  }

  ///O'qituvchilar fuqarolik mehnat shakli bo'yicha ma'lumotlar olib kelinyapti
  Future<List<TeacherLeaderEntity>> getCitizenStatisticData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/citizenship");
    return List.from((response.data as List<dynamic>).map((value) => TeacherLeaderModel.fromJson(value)));
  }

  ///O'qituvchilar yoshi bo'yicha olib kelinyapti
  Future<List<TeacherPositionEntity>> getTeachersAgeStatisticData() async{
    final response = await _dio.get("https://stat.edu.uz/api/teacher/statistic/ageGreaterOrLessThan30");
    return List.from((response.data as List<dynamic>).map((value) => TeacherPositionModel.fromJsonForAgeData(value)));
  }

  ///Professor va o'qituvchilar jins kesimida
  Future<List<OtmGenderEntity>> getProfessorAndTeacherGenderData() async{
    final response = await _dio.get("https://stat.edu.uz/api/statistic/common/teacher/ownershipAndGender");
    return List.from((response.data as List<dynamic>).map((value) => OtmGenderModel.fromJson(value)));
  }

}