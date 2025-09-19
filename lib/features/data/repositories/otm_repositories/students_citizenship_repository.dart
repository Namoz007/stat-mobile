import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipRepository extends StudentsCitizenshipRepo{
  final _dataSource = getIt<StudentsCitizenshipDataSource>();

  ///Talbalar/Fuqaroligi talabalar jins kesimida ma'lumotlarini olib kelyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsGenderData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsGenderData());
  }

  ///Talbalar/Fuqaroligi talabalar yoshi bo'yicha ma'luotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsAgeData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsAgeData());

  }

  ///Talabalar/Fuqaroligi talabalar kurslari bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsCoursesData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsCourses());
  }

}