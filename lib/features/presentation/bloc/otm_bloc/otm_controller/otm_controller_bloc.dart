import 'package:stat_edu_mobile/sources.dart';

class OtmControllerBloc extends Bloc<OtmControllerEvent, OtmControllerState> {
  OtmControllerBloc()
    : super(
        OtmControllerState.empty(),
      ) {
    on<GetUniversitiesOtmControllerEvent>(_getUniversities);
    on<GetProfessorsGenderOtmControllerEvent>(_getProfessorsGender);
    on<GetStudentsCountDataOtmControllerEvent>(_getStudentsCountData);
    on<GetOtmOrganizationalTypeOtmControllerEvent>(_getOtmTypeOrganizationType);
    on<GetCountryOTMWithAddressOtmControllerEvent>(_getCountryOTMWithAddress);
    on<GetTopFiveManyUniversitiesOtmControllerEvent>(_getTopFiveManyStudentsUniversities);
    on<UpdateStateOtmControllerEvent>(_updateState);

  }

  final _repository = getIt<OtmControllerRepositoryImpl>();

  void _updateState(UpdateStateOtmControllerEvent event,emit){
    emit(OtmControllerState.empty());
    add(GetUniversitiesOtmControllerEvent(update: true));
    add(GetProfessorsGenderOtmControllerEvent(update: true));
    add(GetStudentsCountDataOtmControllerEvent(update: true));
    add(GetOtmOrganizationalTypeOtmControllerEvent(update: true));
    add(GetCountryOTMWithAddressOtmControllerEvent(update: true));
    add(GetTopFiveManyUniversitiesOtmControllerEvent(update: true));
  }


  void _getTopFiveManyStudentsUniversities(GetTopFiveManyUniversitiesOtmControllerEvent event, emit,) async {
    if(state.topFiveUniversityData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getTopFiveManyStudentsUniversities().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newTopFiveUniversityData: r))));
    }
  }

  void _getCountryOTMWithAddress(GetCountryOTMWithAddressOtmControllerEvent event, emit,) async {
    if(state.otmDataWithAddress.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getCountryOTMWithAddress().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newOtmDataWithAddress: r))));
    }
  }

  void _getOtmTypeOrganizationType(GetOtmOrganizationalTypeOtmControllerEvent event,emit) async{
    if(state.otmOrganizationalTypeData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getOTMCountWithOrganizationalType().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newOtmOrganizationalTypeData: r.reversed.toList()))));
    }
  }

  void _getStudentsCountData(GetStudentsCountDataOtmControllerEvent event,emit) async{
    if(state.studentsCountData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getStudentsCountWithAcademicDegreeData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsCountData: r))));
    }
  }

  void _getProfessorsGender(GetProfessorsGenderOtmControllerEvent event,emit) async{
    if(state.professorsGenderData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessorsGenderData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newProfessorsGender: r))));
    }
  }

  void _getUniversities(GetUniversitiesOtmControllerEvent event,emit) async{
    if(state.universities.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getAllOtmData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newUniversities: r))));
    }
  }

}
