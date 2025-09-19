import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class StudentsAgeResidenceRepository extends StudentsAgeResidenceRepo{
  final _dataSource = getIt<StudentsAgeResidenceDataSource>();

  ///Talabalar/Yoshi talabalar turar joyi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsResidenceData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsResidenceData());
  }

  ///Talabalar/Yoshi talabalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsGenderData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsGenderData());
  }

  ///Talabalar/Yashash joyi talabalar jinsi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsGenderForResidenceData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsResidenceForResidenceTypeData());
  }

}