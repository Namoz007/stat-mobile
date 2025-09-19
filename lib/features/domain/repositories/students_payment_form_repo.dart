import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";

abstract class StudentsPaymentFormRepo{

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsGenderData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsAgeData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsCitizenshipData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsCourses();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsResidenceData();

}