import 'package:stat_edu_mobile/sources.dart';

part 'doctoral_studies_controller_event.dart';
part 'doctoral_studies_controller_state.dart';
class DoctoralStudiesControllerBloc extends Bloc<DoctoralStudiesControllerEvent,DoctoralStudiesControllerState>{
  DoctoralStudiesControllerBloc() : super(DoctoralStudiesControllerState.initialState()){
    on<GetOrganizationsDataDoctoralStudiesControllerEvent>(_getOrganizationsData);
    on<GetProvinceOTMAndEducationOrganizationDataDoctoralStudiesControllerEvent>(_getProvinceOTMAndEducationOrganizationsData);
    on<GetProvinceAndDoctoralCountDataDoctoralStudiesControllerEvent>(_getProvinceAndDoctoralCountData);
    on<GetDirectionsDataDoctoralStudiesControllerEvent>(_getDirectionsData);
  }

  final _repository = getIt<DoctoralStudiesRepository>();
  
  void _getDirectionsData(GetDirectionsDataDoctoralStudiesControllerEvent event,emit) async{
    if(state.directionsData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getDoctoralDirectionsData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newDirectionsData: r))));
    }
  }
  
  void _getProvinceAndDoctoralCountData(GetProvinceAndDoctoralCountDataDoctoralStudiesControllerEvent event,emit) async{
    if(state.provinceDoctoralAndLeadersData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getDoctoralStudiesProvinceDoctoralData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newDoctoralAndLeadersData: r))));
    }
  }

  void _getProvinceOTMAndEducationOrganizationsData(GetProvinceOTMAndEducationOrganizationDataDoctoralStudiesControllerEvent event,emit) async{
    if(state.provinceOTMAndOrganizationsData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getDoctoralStudiesProvinceOTMData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newOTMAndOrganizations: r))));
    }
  }

  void _getOrganizationsData(GetOrganizationsDataDoctoralStudiesControllerEvent event,emit) async{
    if(state.organizationsData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getDoctoralStudiesOrganizationsData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newOrganizationsData: r))));
    }
  }
}