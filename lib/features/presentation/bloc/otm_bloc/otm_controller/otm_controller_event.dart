
sealed class OtmControllerEvent{}

final class GetUniversitiesOtmControllerEvent extends OtmControllerEvent{
  bool update;

  GetUniversitiesOtmControllerEvent({required this.update});
}

final class GetProfessorsGenderOtmControllerEvent extends OtmControllerEvent{
  bool update;

  GetProfessorsGenderOtmControllerEvent({required this.update});
}

final class GetStudentsCountDataOtmControllerEvent extends OtmControllerEvent{
  bool update;

  GetStudentsCountDataOtmControllerEvent({required this.update});
}

final class GetOtmOrganizationalTypeOtmControllerEvent extends OtmControllerEvent{
  bool update;

  GetOtmOrganizationalTypeOtmControllerEvent({required this.update});
}

final class GetCountryOTMWithAddressOtmControllerEvent extends OtmControllerEvent {
  bool update;

  GetCountryOTMWithAddressOtmControllerEvent({required this.update});
}

final class GetTopFiveManyUniversitiesOtmControllerEvent extends OtmControllerEvent {
  bool update;

  GetTopFiveManyUniversitiesOtmControllerEvent({required this.update});
}

final class UpdateStateOtmControllerEvent extends OtmControllerEvent{}