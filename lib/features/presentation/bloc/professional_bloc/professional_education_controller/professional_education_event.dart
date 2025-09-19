part of 'professional_education_bloc.dart';

sealed class ProfessionalEducationEvent {}

final class GetStudentsDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetStudentsDataProfessionalEducationEvent({required this.update});
}

final class GetEducationFormDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetEducationFormDataProfessionalEducationEvent({required this.update});
}

final class GetPaymentFormDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetPaymentFormDataProfessionalEducationEvent({required this.update});
}

final class GetCoursesDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetCoursesDataProfessionalEducationEvent({required this.update});
}

final class GetCitizenshipDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetCitizenshipDataProfessionalEducationEvent({required this.update});
}

final class GetAgeDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetAgeDataProfessionalEducationEvent({required this.update});
}

final class GetResidenceAreaDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetResidenceAreaDataProfessionalEducationEvent({required this.update});
}

final class GetAreasSectionDataProfessionalEducationEvent extends ProfessionalEducationEvent{
  bool update;

  GetAreasSectionDataProfessionalEducationEvent({required this.update});
}