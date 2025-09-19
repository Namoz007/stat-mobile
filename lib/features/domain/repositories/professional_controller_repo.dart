import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";

abstract class ProfessionalControllerRepo{

  Future<Either<Failure,ProfessionalAreasSectionResponseEntity>> getProfessionalAreasSectionData();

  Future<Either<Failure,ProfessionalResidenceAreaResponseEntity>> getProfessionalResidenceAreaData();

  Future<Either<Failure,ProfessionalAgeResponseEntity>> getProfessionalAgeData();

  Future<Either<Failure,ProfessionalCitizenshipResponseEntity>> getProfessionalCitizenshipData();

  Future<Either<Failure,ProfessionalCoursesResponseEntity>> getProfessionalCoursesData();

  Future<Either<Failure,ProfessionalPaymentFormResponseEntity>> getProfessionalPaymentFormData();

  Future<Either<Failure,ProfessionalEducationFormResponseEntity>> getProfessionalEducationFormData();

  Future<Either<Failure,ProfessionalEducationTypeResponseEntity>> getProfessionalEducationTypeData();

  Future<Either<Failure,List<ProfessionalInstitutionEntity>>> getProfessionalInstitutionData();
}