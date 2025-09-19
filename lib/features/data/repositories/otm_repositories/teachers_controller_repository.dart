import 'package:stat_edu_mobile/sources.dart';
import 'package:dartz/dartz.dart';
class TeachersControllerRepository extends TeachersControllerRepo{
  final _dataSources = getIt<TeachersControllerDataSource>();

  ///O'qituvchilar bo'limidagi o'qituvchilarning jinsi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherLeaderEntity>>> getTeachersGenderData() {
    return RequestAdapter<List<TeacherLeaderEntity>>().handleRequest(() => _dataSources.getTeachersGenderData());
  }

  ///Oliy ta'limdagi professor va o'qituvchilar jinsi kesimidagi ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<OtmGenderEntity>>> getProfessorAndTeacherData() {
    return RequestAdapter<List<OtmGenderEntity>>().handleRequest(() => _dataSources.getProfessorAndTeacherGenderData());
  }

  ///Oliy ta'limdagi o'qituvchilar yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherPositionEntity>>> getTeachersAgeStatisticData() {
    final response = RequestAdapter<List<TeacherPositionEntity>>();
    return response.handleRequest(() => _dataSources.getTeachersAgeStatisticData());
  }

  ///O'qituvchilar fuqarolik mehnat shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherLeaderEntity>>> getCitizenStatisticData() {
    final response = RequestAdapter<List<TeacherLeaderEntity>>();
    return response.handleRequest(() => _dataSources.getCitizenStatisticData());
  }

  ///O'qituvchilar mehnat shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherLeaderEntity>>> getLaborFormData() {
    final response = RequestAdapter<List<TeacherLeaderEntity>>();
    return response.handleRequest(() => _dataSources.getLaborFormData());
  }

  ///O'qituvchilar lavozim bo'yicha ma'lumotlar olib kelinaypti
  @override
  Future<Either<Failure, List<TeacherLeaderEntity>>> getPositionStatisticData() {
    final response = RequestAdapter<List<TeacherLeaderEntity>>();
    return response.handleRequest(() => _dataSources.getPositionStatisticData());
  }

  ///O'qituvchilar ilmiy unvon bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherPositionEntity>>> getTeachersPositionData() {
    final response = RequestAdapter<List<TeacherPositionEntity>>();
    return response.handleRequest(() => _dataSources.getTeachersPositionData());
  }

  ///O'qituvchilar ilmiy daraja bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherPositionEntity>>> getTeachersEducationRankData() {
    final response = RequestAdapter<List<TeacherPositionEntity>>();
    return response.handleRequest(() => _dataSources.getTeachersEducationRankData());
  }

  ///O'qituvchilar rahbalar bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<TeacherLeaderEntity>>> getTeachersLeaderData() {
    final response = RequestAdapter<List<TeacherLeaderEntity>>();
    return response.handleRequest(() => _dataSources.getTeachersLeaderData());
  }



}