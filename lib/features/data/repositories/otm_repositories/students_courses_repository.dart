import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';
class StudentsCoursesRepository extends StudentsCoursesRepo{
  final _dataSource = getIt<StudentsCoursesDataSource>();

  ///Talbalar/Kurslar talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsAgeData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsAgeData());
  }

  ///Talbalar/Kurslar talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsGenderData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsGenderData());
  }

  ///Talbalar/Kurslar talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsResidenceData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsResidenceData());
  }

}