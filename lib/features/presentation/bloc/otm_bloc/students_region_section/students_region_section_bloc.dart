import 'package:stat_edu_mobile/sources.dart';

part 'students_region_section_event.dart';
part 'students_region_section_state.dart';

class StudentsRegionSectionBloc extends Bloc<StudentsRegionSectionEvent,StudentsRegionSectionState>{
  StudentsRegionSectionBloc() : super(StudentsRegionSectionState.initialState()){
    on<GetGenderStudentsRegionSectionEvent>(_getStudentsGenderData);
    on<GetEducationTypeStudentsRegionSectionEvent>(_getStudentsEducationTypeData);
    on<GetAgeStudentsRegionSectionEvent>(_getStudentsAgeData);
    on<GetPaymentFormStudentsRegionSectionEvent>(_getStudentsPaymentFormData);
    on<GetCoursesStudentsRegionSectionEvent>(_getStudentsCoursesData);
    on<GetCitizenshipStudentsRegionSectionEvent>(_getStudentsCitizenshipData);
    on<GetResidenceStudentsRegionSectionEvent>(_getStudentsResidenceData);
    on<GetEducationFormStudentsRegionSectionEvent>(_getStudentsEducationFormData);
    on<UpdateStateStudentsRegionSectionEvent>(_updateState);
  }
  final _repository = getIt<StudentsRegionSectionRepository>();

  void _updateState(UpdateStateStudentsRegionSectionEvent event,emit){
    emit(StudentsRegionSectionState.initialState());
    add(GetGenderStudentsRegionSectionEvent());
    add(GetEducationTypeStudentsRegionSectionEvent());
    add(GetAgeStudentsRegionSectionEvent());
    add(GetPaymentFormStudentsRegionSectionEvent());
    add(GetCoursesStudentsRegionSectionEvent());
    add(GetCitizenshipStudentsRegionSectionEvent());
    add(GetResidenceStudentsRegionSectionEvent());
    add(GetEducationFormStudentsRegionSectionEvent());
  }


  void _getStudentsEducationFormData(GetEducationFormStudentsRegionSectionEvent event,emit) async{
    if(state.studentsEducationForm.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsEducationFormData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsEducationFormData: r)));
    }
  }

  void _getStudentsResidenceData(GetResidenceStudentsRegionSectionEvent event,emit) async{
    if(state.studentsResidenceData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsResidenceData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsResidenceData: r)));
    }
  }

  void _getStudentsCitizenshipData(GetCitizenshipStudentsRegionSectionEvent event,emit) async{
    if(state.studentsCitizenshipData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsCitizenshipData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsCitizenshipData: r)));
    }
  }

  void _getStudentsCoursesData(GetCoursesStudentsRegionSectionEvent event,emit) async{
    if(state.studentsCoursesData.isEmpty ){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsCoursesData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsCoursesData: r)));
    }
  }

  void _getStudentsPaymentFormData(GetPaymentFormStudentsRegionSectionEvent event,emit) async{
    if(state.studentsPaymentFormData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsPaymentFormData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsPaymentFormData: r)));
    }
  }

  void _getStudentsGenderData(GetGenderStudentsRegionSectionEvent event,emit) async{
    if(state.studentsGenderData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsGenderData: r.reversed.toList())));
    }
  }

  void _getStudentsEducationTypeData(GetEducationTypeStudentsRegionSectionEvent event,emit) async{
    if(state.studentsEducationTypeData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsEducationTypeData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsEducationType: r)));
    }
  }

  void _getStudentsAgeData(GetAgeStudentsRegionSectionEvent event,emit) async{
    if(state.studentsAgeData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsAgeData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsAgeData: r)));
    }
  }

}