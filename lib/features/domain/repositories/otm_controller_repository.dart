import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";

abstract class OtmControllerRepo{

  Future<Either<Failure,List<UniversityEntity>>> getAllOtmData();

  Future<Either<Failure,List<OtmGenderEntity>>> getProfessorsGenderData();

  Future<Either<Failure,List<OtmUniversityTypeEntity>>> getOTMCountWithOrganizationalType();

  Future<Either<Failure,List<StudentCourseEntity>>> getStudentsCountWithAcademicDegreeData();

  Future<Either<Failure,List<TopUniversityEntity>>> getTopFiveManyStudentsUniversities();

  Future<Either<Failure,List<OTMAreaEntity>>> getCountryOTMWithAddress();


}