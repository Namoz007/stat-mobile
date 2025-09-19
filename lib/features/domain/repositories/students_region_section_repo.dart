import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";

abstract class StudentsRegionSectionRepo{

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsGenderData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsEducationTypeData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsAgeData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsPaymentFormData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsCoursesData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsCitizenshipData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsResidenceData();

  Future<Either<Failure,List<RegionDataEntity>>> getStudentsEducationFormData();



}