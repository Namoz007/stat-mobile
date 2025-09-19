import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";
abstract class TeachersControllerRepo{

  Future<Either<Failure,List<TeacherLeaderEntity>>> getTeachersLeaderData();

  Future<Either<Failure,List<TeacherPositionEntity>>> getTeachersEducationRankData();

  Future<Either<Failure,List<TeacherPositionEntity>>> getTeachersPositionData();

  Future<Either<Failure,List<TeacherLeaderEntity>>> getPositionStatisticData();

  Future<Either<Failure,List<TeacherLeaderEntity>>> getLaborFormData();

  Future<Either<Failure,List<TeacherLeaderEntity>>> getCitizenStatisticData();

  Future<Either<Failure,List<TeacherPositionEntity>>> getTeachersAgeStatisticData();

  Future<Either<Failure,List<OtmGenderEntity>>> getProfessorAndTeacherData();

  Future<Either<Failure,List<TeacherLeaderEntity>>> getTeachersGenderData();

}