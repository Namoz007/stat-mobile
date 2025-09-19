import 'package:stat_edu_mobile/sources.dart';

part 'professional_education_event.dart';
part 'professional_education_state.dart';

class ProfessionalEducationBloc extends Bloc<ProfessionalEducationEvent, ProfessionalEducationState> {
  ProfessionalEducationBloc() : super(ProfessionalEducationState.initialState()){
    on<GetStudentsDataProfessionalEducationEvent>(_getEducationTypeData);
    on<GetEducationFormDataProfessionalEducationEvent>(_getEducationFormData);
    on<GetPaymentFormDataProfessionalEducationEvent>(_getPaymentFormData);
    on<GetCoursesDataProfessionalEducationEvent>(_getCoursesData);
    on<GetCitizenshipDataProfessionalEducationEvent>(_getCitizenshipData);
    on<GetAgeDataProfessionalEducationEvent>(_getAgeData);
    on<GetResidenceAreaDataProfessionalEducationEvent>(_getResidenceAreaData);
    on<GetAreasSectionDataProfessionalEducationEvent>(_getAreasSectionData);
  }

  final _repository = getIt<ProfessionalControllerRepositoryImpl>();
  final datasource = getIt<ProfessionalControllerDataSources>();

  void _getAreasSectionData(GetAreasSectionDataProfessionalEducationEvent event,emit) async{
    if(state.areasSectionResponseData.empty || event.update){
      datasource.getProfessionalAreasSectionData();
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalAreasSectionData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newAreasSectionData: r))));
    }
  }

  void _getResidenceAreaData(GetResidenceAreaDataProfessionalEducationEvent event,emit) async{
    if(state.residenceAreaResponseData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalResidenceAreaData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newResidenceAreaData: r))));
    }
  }

  void _getAgeData(GetAgeDataProfessionalEducationEvent event,emit) async{
    if(state.ageResponseData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalAgeData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newAgeData: r))));
    }
  }

  void _getCitizenshipData(GetCitizenshipDataProfessionalEducationEvent event,emit)async{
    if(state.citizenshipResponseData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalCitizenshipData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newCitizenshipData: r))));
    }
  }

  void _getCoursesData(GetCoursesDataProfessionalEducationEvent event,emit) async{
    if(state.coursesData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalCoursesData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newCoursesData: r))));
    }
  }

  void _getPaymentFormData(GetPaymentFormDataProfessionalEducationEvent event,emit) async{
    if(state.paymentFormData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalPaymentFormData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newPaymentFormData: r))));
    }
  }

  void _getEducationFormData(GetEducationFormDataProfessionalEducationEvent event,emit) async{
    if(state.educationFormData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalEducationFormData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newEducationFormResponse: r))));
    }
  }

  void _getEducationTypeData(GetStudentsDataProfessionalEducationEvent event,emit) async{
    if(state.educationTypeData.empty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalEducationTypeData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newEducationTypeData: r))));
    }
  }

}
