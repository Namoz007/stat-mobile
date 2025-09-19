import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionRepository extends StudentsRegionSectionRepo{
  final _dataSource = getIt<StudentsRegionSectionDataSource>();

  ///Talabalar/Hududlar_kesimida talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsAgeData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsAgeData());
  }

  ///Talabalar/Hududlar_kesimida talabalar fuqaroligi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsCitizenshipData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsCitizenshipData());
  }

  ///Talabalar/Hududlar_kesimida talabalar kurslar bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsCoursesData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsCoursesData());

  }

  ///Talabalar/Hududlar_kesimida talabalar talim shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsEducationFormData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsEducationFormData());

  }

  ///Talabalar/Hududlar_kesimida talabalar talim turi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsEducationTypeData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsEducationTypeData());

  }

  ///Talabalar/Hududlar_kesimida talabalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsGenderData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsGenderData());

  }

  ///Talabalar/Hududlar_kesimida talabalar to'lov shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsPaymentFormData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsPaymentFormData());

  }

  ///Talabalar/Hududlar_kesimida talabalar yashash joyi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<RegionDataEntity>>> getStudentsResidenceData() {
    return RequestAdapter<List<RegionDataEntity>>().handleRequest(() => _dataSource.getStudentsResidenceData());
  }

}