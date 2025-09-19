import "package:stat_edu_mobile/sources.dart";
import "package:dartz/dartz.dart";

abstract class StudentsEducationFormControllerRepo {

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsGenderData();


  Future<Either<Failure,
      List<StudentCourseEntity>>> getStudentsAgeStatisticData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsCitizenshipData();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsEducationCourses();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsEducationPaymentType();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsResidenceArea();

}