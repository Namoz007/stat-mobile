import 'package:stat_edu_mobile/sources.dart';
import 'package:dartz/dartz.dart';

class StudentsEducationFormControllerRepository extends StudentsEducationFormControllerRepo{

  final _dataSource = getIt<StudentsEducationFormDataSource>();

  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsGenderData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsGenderData());
  }

  ///Talabalar/ta'lim shakli yashash joyi ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsResidenceArea() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsEducationResidenceArea());
  }

  ///Talabalar/ta'lim shakli kurslar ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsEducationCourses() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsEducationCourses());
  }


  ///Talabalar/ta'lim shakli ma'lumotlari olib kelish
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsEducationPaymentType() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsEducationPaymentType());
  }

  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsCitizenshipData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsCitizenshipData());
  }


  ///Talbalar/ta'lim shakli yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsAgeStatisticData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSource.getStudentsAgeByEducationForm());
  }



}