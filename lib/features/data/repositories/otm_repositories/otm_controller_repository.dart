import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class OtmControllerRepositoryImpl extends OtmControllerRepo{
  final _dataSources = getIt<OtmControllerDataSource>();

  ///Oliy ta'limdagi barcha universitetlar ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<UniversityEntity>>> getAllOtmData() async{
    final response = RequestAdapter<List<UniversityEntity>>();
    return response.handleRequest(() => _dataSources.getOtmDataList());
  }

  ///Oliy ta'limdagi barcha professorlar va o'qituvchilar ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<OtmGenderEntity>>> getProfessorsGenderData() {
    return RequestAdapter<List<OtmGenderEntity>>().handleRequest(() => _dataSources.getProfessorsGenderData());
  }

  ///Oliy ta'limdagi otmlar tashkiliy turi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<OtmUniversityTypeEntity>>> getOTMCountWithOrganizationalType() {
    return RequestAdapter<List<OtmUniversityTypeEntity>>().handleRequest(() => _dataSources.getOTMCountWithOrganizationalType());
  }

  ///Oliy ta'limdagi talabalar darajasi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsCountWithAcademicDegreeData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSources.getStudentsCountWithAcademicDegreeData());
  }

  ///Oliy ta'limdagi talabalar otm joylashuv bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<OTMAreaEntity>>> getCountryOTMWithAddress() {
    final response = RequestAdapter<List<OTMAreaEntity>>();
    return response.handleRequest(() => _dataSources.getCountryOTMWithArea());
  }

  ///Oliy ta'limdagi eng ko'p talabaga ega top 5 otm
  @override
  Future<Either<Failure, List<TopUniversityEntity>>> getTopFiveManyStudentsUniversities() {
    return RequestAdapter<List<TopUniversityEntity>>().handleRequest(() => _dataSources.topFiveManyStudentsUniversities());
  }

}