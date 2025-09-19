part of 'doctoral_studies_controller_bloc.dart';

sealed class DoctoralStudiesControllerEvent{}

final class GetOrganizationsDataDoctoralStudiesControllerEvent extends DoctoralStudiesControllerEvent{
  bool update;

  GetOrganizationsDataDoctoralStudiesControllerEvent({required this.update});
}

final class GetProvinceOTMAndEducationOrganizationDataDoctoralStudiesControllerEvent extends DoctoralStudiesControllerEvent{
  bool update;

  GetProvinceOTMAndEducationOrganizationDataDoctoralStudiesControllerEvent({required this.update});
}

final class GetProvinceAndDoctoralCountDataDoctoralStudiesControllerEvent extends DoctoralStudiesControllerEvent{
  bool update;

  GetProvinceAndDoctoralCountDataDoctoralStudiesControllerEvent({required this.update});
}

final class GetDirectionsDataDoctoralStudiesControllerEvent extends DoctoralStudiesControllerEvent{
  bool update;

  GetDirectionsDataDoctoralStudiesControllerEvent({required this.update});
}