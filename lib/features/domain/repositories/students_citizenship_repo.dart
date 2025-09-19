import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";
abstract class StudentsCitizenshipRepo{

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsGenderData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsAgeData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsCoursesData();
}