import 'package:stat_edu_mobile/sources.dart';

class TeachersControllerState {
  bool loading;
  List<TeacherLeaderEntity> teachersLeaderData;
  List<TeacherPositionEntity> teachersEducationRankTypeData;
  List<TeacherPositionEntity> teachersPositionData;
  List<TeacherLeaderEntity> positionStatisticData;
  List<TeacherLeaderEntity> laborFormStatisticData;
  List<TeacherLeaderEntity> citizenLaborFormData;
  List<TeacherPositionEntity> teachersAgeStatisticData;
  List<OtmGenderEntity> professerAndTeacherGenderData;
  List<TeacherLeaderEntity> teachersGenderData;

  TeachersControllerState({
    required this.loading,
    required this.teachersLeaderData,
    required this.teachersEducationRankTypeData,
    required this.teachersPositionData,
    required this.positionStatisticData,
    required this.laborFormStatisticData,
    required this.citizenLaborFormData,
    required this.teachersAgeStatisticData,
    required this.professerAndTeacherGenderData,
    required this.teachersGenderData,
  });

  TeachersControllerState copyWith({
    bool? isLoading,
    List<TeacherLeaderEntity>? newTeachersLeader,
    List<TeacherPositionEntity>? newTeachersEducationRankData,
    List<TeacherPositionEntity>? newTeachersPositionData,
    List<TeacherLeaderEntity>? newPositionStatisticData,
    List<TeacherLeaderEntity>? newLaborStatisticData,
    List<TeacherLeaderEntity>? newCitizenData,
    List<TeacherPositionEntity>? newTeachersAgeStatisticData,
    List<OtmGenderEntity>? newProfessorsAndTeacherData,
    List<TeacherLeaderEntity>? newTeachersGenderData,
  }) {
    return TeachersControllerState(
      loading: isLoading ?? loading,
      teachersLeaderData: newTeachersLeader ?? teachersLeaderData,
      teachersEducationRankTypeData: newTeachersEducationRankData ?? teachersEducationRankTypeData,
      teachersPositionData: newTeachersPositionData ?? teachersPositionData,
      positionStatisticData: newPositionStatisticData ?? positionStatisticData,
      laborFormStatisticData: newLaborStatisticData ?? laborFormStatisticData,
      citizenLaborFormData: newCitizenData ?? citizenLaborFormData,
      teachersAgeStatisticData:  newTeachersAgeStatisticData ?? teachersAgeStatisticData,
      professerAndTeacherGenderData: newProfessorsAndTeacherData ?? professerAndTeacherGenderData,
      teachersGenderData: newTeachersGenderData ?? teachersGenderData,
    );
  }

  factory TeachersControllerState.empty() => TeachersControllerState(
    loading: false,
    teachersLeaderData: [],
    teachersEducationRankTypeData: [],
    teachersPositionData: [],
    positionStatisticData: [],
    laborFormStatisticData: [],
    citizenLaborFormData: [],
    teachersAgeStatisticData: [],
    professerAndTeacherGenderData: [],
    teachersGenderData: [],
  );
}
