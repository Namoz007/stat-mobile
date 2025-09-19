import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/core/core.dart';
import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class StudentsControllerRepo{

  Future<Either<Failure,List<StudentByAgeStatisticEntity>>> getStudentsPaymentType();

  Future<Either<Failure,List<StudentByAgeStatisticEntity>>> getStudentsCitizenship();

  Future<Either<Failure,List<OtmGenderEntity>>> getStudentsCountByGender();

  Future<Either<Failure,List<OtmEducationTypeEntity>>> getStudentsEducationType();

  Future<Either<Failure,List<StudentOtmCourseEntity>>> getOTMStudentsCourses();


  Future<Either<Failure,List<StudentsEducationFormEntity>>> getStudentsEducationFormData();

  Future<Either<Failure,List<OTMAreaEntity>>> getManyStudentsArea();

  Future<Either<Failure,List<StudentByAgeStatisticEntity>>> getStudentsAgeStatisticData();

  Future<Either<Failure,List<StudentPaymentDataEntity>>> getStudentsPaymentTypeData();

  Future<Either<Failure,List<StudentByAgeStatisticEntity>>> getStudentsCourse();

  Future<Either<Failure,List<StudentByAgeStatisticEntity>>> getStudentsOtmEducationFormData();

  Future<Either<Failure,List<StudentCourseEntity>>> getEducationTypeStatisticData();


}