import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";

abstract class DoctoralStudiesRepo{
  Future<Either<Failure,List<DoctoralStudiesDirectionDoctoralEntity>>> getDoctoralDirectionsData();

  Future<Either<Failure,List<DoctoralStudiesProvinceDoctoralEntity>>> getDoctoralStudiesProvinceDoctoralData();

  Future<Either<Failure,List<DoctoralStudiesProvinceEducationOrganizationsEntity>>> getDoctoralStudiesProvinceOTMData();

  Future<Either<Failure,List<DoctoralStudiesOrganizationEntity>>> getDoctoralStudiesOrganizationsData();

}