import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentFormRepository extends StudentsPaymentFormRepo{
  final _dataSources = getIt<StudentsPaymentFormDataSource>();

  ///Talabalar/To'lov shakli talabalar yashash joyi boyicha malumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsResidenceData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSources.getStudentsResidenceData());
  }
  
  ///Talabalar/To'lov shakli talabalar kurslar boyicha malumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsCourses() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSources.getStudentsCoursesData());
  }
  
  ///Talabalar/To'lov shakli talabalar yoshi bo'yicha ma'lumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsAgeData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSources.getStudentsAgeData());
  }
  
  ///Talabalar/To'lov shakli talabalar jinsi bo'yicha malumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsGenderData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSources.getStudentsGenderData());
  }

  ///Talabalar/To'lov shakli talabalar fuqarolig bo'yicha malumotlar olib kelinyapti
  @override
  Future<Either<Failure, List<StudentCourseEntity>>> getStudentsCitizenshipData() {
    return RequestAdapter<List<StudentCourseEntity>>().handleRequest(() => _dataSources.getStudentsPaymentFormCitizenshipData());
  }
  
}