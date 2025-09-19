import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class ProfessionalControllerRepositoryImpl extends ProfessionalControllerRepo{
  final _dataSources = getIt<ProfessionalControllerDataSources>();

  ///Proefssional ta'limni hududlar kesimida ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, ProfessionalAreasSectionResponseEntity>> getProfessionalAreasSectionData() {
    return RequestAdapter<ProfessionalAreasSectionResponseEntity>().handleRequest(() => _dataSources.getProfessionalAreasSectionData());
  }

  ///Professional ta'limni yashash joyi bo'yicha ma'lumotlar olib kelinmoqda
  @override
  Future<Either<Failure, ProfessionalResidenceAreaResponseEntity>> getProfessionalResidenceAreaData() {
    return RequestAdapter<ProfessionalResidenceAreaResponseEntity>().handleRequest(() => _dataSources.getProfessionalResidenceAreaData());
  }

  ///Profissonal ta'limni yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, ProfessionalAgeResponseEntity>> getProfessionalAgeData() {
    return RequestAdapter<ProfessionalAgeResponseEntity>().handleRequest(() => _dataSources.getProfessionalAgeData());
  }
  
  ///Professional ta'limni fuqaroligi bo'yicha ma'lutlar olib kelinaypti
  @override
  Future<Either<Failure, ProfessionalCitizenshipResponseEntity>> getProfessionalCitizenshipData() {
    return RequestAdapter<ProfessionalCitizenshipResponseEntity>().handleRequest(() => _dataSources.getProfessionalCitizenshipData());
  }
  
  ///Professional ta'limni kurslar bo'yicha ma'lumolar olib kelinyapti
  @override
  Future<Either<Failure, ProfessionalCoursesResponseEntity>> getProfessionalCoursesData() {
    return RequestAdapter<ProfessionalCoursesResponseEntity>().handleRequest(() => _dataSources.getProfessionalCoursesData());
  }

  ///Professional ta'limni to'lov shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, ProfessionalPaymentFormResponseEntity>> getProfessionalPaymentFormData() {
    return RequestAdapter<ProfessionalPaymentFormResponseEntity>().handleRequest(() => _dataSources.getProfessionalPaymentFormData());
  }

  ///Professional ta'limni ta'lim shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, ProfessionalEducationFormResponseEntity>> getProfessionalEducationFormData() {
    return RequestAdapter<ProfessionalEducationFormResponseEntity>().handleRequest(() => _dataSources.getProfessionalEducationFormData());
  }

  ///Professional ta'limdagi muassasalar ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<ProfessionalInstitutionEntity>>> getProfessionalInstitutionData() {
    return RequestAdapter<List<ProfessionalInstitutionEntity>>().handleRequest(() => _dataSources.getProfessionalInstitutionData()) ;
  }

  ///Kasb ta'limdagi ta'labalar ma'lumotlari olib kelinmoqda
  @override
  Future<Either<Failure, ProfessionalEducationTypeResponseEntity>> getProfessionalEducationTypeData() {
    return RequestAdapter<ProfessionalEducationTypeResponseEntity>().handleRequest(() => _dataSources.getProfessionalEducationTypeData());
  }

}