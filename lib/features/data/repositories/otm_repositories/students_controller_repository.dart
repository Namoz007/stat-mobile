import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';
class StudentsControllerRepository extends StudentsControllerRepo{

  final _dataSource = getIt<StudentsControllerDataSource>();


  ///Talabalar/ta'lim turidagi talabalar soni to'lov shaklidagi ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentPaymentDataEntity>>> getStudentsPaymentTypeData() {
    return RequestAdapter<List<StudentPaymentDataEntity>>().handleRequest(() => _dataSource.getStudentsPaymentTypeData());
  }

  ///Talabalar/ta'lim turidagi yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentByAgeStatisticEntity>>> getStudentsAgeStatisticData() {
    return RequestAdapter<List<StudentByAgeStatisticEntity>>().handleRequest(() => _dataSource.getStudentsAgeStatisticData());
  }

  ///Talabalar/ta'lim turidagi to'lov shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentByAgeStatisticEntity>>> getStudentsPaymentType() {
    return RequestAdapter<List<StudentByAgeStatisticEntity>>().handleRequest(() => _dataSource.getStudentsPaymentType());
  }

  ///Talabalar/ta'lim turidagi kurslar bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentByAgeStatisticEntity>>> getStudentsCourse() {
    return RequestAdapter<List<StudentByAgeStatisticEntity>>().handleRequest(() => _dataSource.getStudentsCoursesData());
  }

  ///Talabalar/ta'lim turidagi talabalar fuqaroligi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentByAgeStatisticEntity>>> getStudentsCitizenship() {
    return RequestAdapter<List<StudentByAgeStatisticEntity>>().handleRequest(() => _dataSource.getStudentsCitizenshipData());
  }

  ///Talabalar/ta'lim turidagi ta'lim shakli bo'yicha ma'lutmolar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentByAgeStatisticEntity>>> getStudentsOtmEducationFormData() {
    return RequestAdapter<List<StudentByAgeStatisticEntity>>().handleRequest(() => _dataSource.getStudentsOtmEducationData());
  }

  ///Oliy ta'limdagi talabalar soni jins kesimida ma'lumotlar olib kelinmoqda
  @override
  Future<Either<Failure, List<OtmGenderEntity>>> getStudentsCountByGender() {
    return RequestAdapter<List<OtmGenderEntity>>().handleRequest(() => _dataSource.getStudentsCountByGender());
  }

  ///Oliy ta'limdaig talabalar soni  kurs kesimida ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentOtmCourseEntity>>> getOTMStudentsCourses() {
    return RequestAdapter<List<StudentOtmCourseEntity>>().handleRequest(() => _dataSource.getOTMStudentsCourses());
  }

  ///Oliyt ta'limdagi talabalar soni ta'lim shakli bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentsEducationFormEntity>>> getStudentsEducationFormData() {
    return RequestAdapter<List<StudentsEducationFormEntity>>().handleRequest(() => _dataSource.getStudentsEducationFormData());
  }


  @override
  Future<Either<Failure, List<OtmEducationTypeEntity>>> getStudentsEducationType() {
    return RequestAdapter<List<OtmEducationTypeEntity>>().handleRequest(() => _dataSource.getStudentsCountEducationType());
  }

  @override
  Future<Either<Failure, List<OTMAreaEntity>>> getManyStudentsArea() {
    final response = RequestAdapter<List<OTMAreaEntity>>();
    return response.handleRequest(() => _dataSource.getManyStudentsArea());
  }

  ///

  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getEducationTypeStatisticData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsEducationTypeData());
  }







}