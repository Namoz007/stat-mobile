import 'package:stat_edu_mobile/sources.dart';

class TeachersControllerBloc
    extends Bloc<TeachersControllerEvent, TeachersControllerState> {
  TeachersControllerBloc() : super(TeachersControllerState.empty()) {
    on<GetTeacherLeaderDataTeachersControllerEvent>(_getTeachersLeader);
    on<GetProfessorsGenderDataTeachersControllerEvent>(_getProfessorsGender);
    on<GetEducationRankTeachersControllerEvent>(_getTeachersEducationRank);
    on<GetPositionDataTeachersControllerEvent>(_getTeachersPositionData);
    on<GetPositionStatisticDataTeachersControllerEvent>(
      _getPositionStatisticData,
    );
    on<GetLaborFormStatisticDataTeachersControllerEvent>(_getLaborFormData);
    on<GetCitizenStatisticDataTeachersControllerEvent>(_getCitizenData);
    on<GetStatisticAgeDataTeachersControllerEvent>(_getTeachersAgeData);
    on<UpdateStateTeachersControllerEvent>(_updateState);
    on<GetTeacherGenderDataTeachersControllerEvent>(_getTeacherGenderData);
  }

  final _repository = getIt<TeachersControllerRepository>();

  void _getTeacherGenderData(GetTeacherGenderDataTeachersControllerEvent event,emit) async{
    if(state.teachersGenderData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getTeachersGenderData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false,)), (r) => emit(state.copyWith(isLoading: false,newTeachersGenderData: r.reversed.toList()))));
    }
  }

  void _updateState(UpdateStateTeachersControllerEvent event, emit) {
    emit(TeachersControllerState.empty());
    add(GetTeacherLeaderDataTeachersControllerEvent(update: true));
    add(GetProfessorsGenderDataTeachersControllerEvent(update: true));
    add(GetEducationRankTeachersControllerEvent(update: true));
    add(GetPositionDataTeachersControllerEvent(update: true));
    add(GetPositionStatisticDataTeachersControllerEvent(update: true));
    add(GetLaborFormStatisticDataTeachersControllerEvent(update: true));
    add(GetCitizenStatisticDataTeachersControllerEvent(update: true));
    add(GetStatisticAgeDataTeachersControllerEvent(update: true));
    add(GetTeacherGenderDataTeachersControllerEvent(update: true));
  }

  void _getTeachersAgeData(
    GetStatisticAgeDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.teachersAgeStatisticData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getTeachersAgeStatisticData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(
          state.copyWith(
            isLoading: false,
            newTeachersAgeStatisticData: r.reversed.toList(),
          ),
        ),
      );
    }
  }

  void _getCitizenData(
    GetCitizenStatisticDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.citizenLaborFormData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getCitizenStatisticData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(state.copyWith(isLoading: false, newCitizenData: r)),
      );
    }
  }

  void _getLaborFormData(
    GetLaborFormStatisticDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.laborFormStatisticData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getLaborFormData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(state.copyWith(isLoading: false, newLaborStatisticData: r)),
      );
    }
  }

  void _getPositionStatisticData(
    GetPositionStatisticDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.positionStatisticData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getPositionStatisticData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) =>
            emit(state.copyWith(isLoading: false, newPositionStatisticData: r)),
      );
    }
  }

  void _getTeachersPositionData(
    GetPositionDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.teachersPositionData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getTeachersPositionData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) =>
            emit(state.copyWith(isLoading: false, newTeachersPositionData: r)),
      );
    }
  }

  void _getTeachersEducationRank(
    GetEducationRankTeachersControllerEvent event,
    emit,
  ) async {
    if (state.teachersEducationRankTypeData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getTeachersEducationRankData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(
          state.copyWith(
            isLoading: false,
            newTeachersEducationRankData: r.reversed.toList(),
          ),
        ),
      );
    }
  }

  void _getProfessorsGender(
    GetProfessorsGenderDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.professerAndTeacherGenderData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessorAndTeacherData().then(
        (value) => value.fold(
          (l) => emit(state.copyWith(isLoading: false)),
          (r) => emit(
            state.copyWith(
              isLoading: false,
              newProfessorsAndTeacherData: r.reversed.toList(),
            ),
          ),
        ),
      );
    }
  }

  void _getTeachersLeader(
    GetTeacherLeaderDataTeachersControllerEvent event,
    emit,
  ) async {
    if (state.teachersLeaderData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getTeachersLeaderData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(state.copyWith(isLoading: false, newTeachersLeader: r)),
      );
    }
  }
}
