import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";
abstract class StudentsAgeResidenceRepo{

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsGenderData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsResidenceData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsGenderForResidenceData();

}