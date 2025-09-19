import 'package:stat_edu_mobile/sources.dart';

part 'students_education_form_controller_event.dart';

part 'students_education_form_controller_state.dart';

class StudentsEducationFormControllerBloc
    extends
        Bloc<
          StudentsEducationFormControllerEvent,
          StudentsEducationFormControllerState
        > {
  StudentsEducationFormControllerBloc()
    : super(StudentsEducationFormControllerState.initialState()) {
    on<GetAgeStatisticStudentsEducationFormControllerEvent>(
      _getStudentsAgeStatistic,
    );
    on<GetCitizenshipStudentsEducationFormControllerEvent>(
      _getStudentsCitizenship,
    );
    on<GetPaymentTypeStudentsEducationFormControllerEvent>(
      _getStudentsEducationPaymentType,
    );
    on<GetCoursesStudentsEducationFormControllerEvent>(_getStudentsCoursesType);
    on<GetResidenceStudentsEducationFormControllerEvent>(_getStudentsResidence);
    on<GetGenderStudentsEducationFormControllerEvent>(_getStudentsGenderData);
    on<UpdateStateStudentsEducationFormControllerEvent>(_updateState);
  }

  final _repository = getIt<StudentsEducationFormControllerRepository>();


  void _updateState(UpdateStateStudentsEducationFormControllerEvent event,emit) {
    emit(StudentsEducationFormControllerState.initialState());
    add(GetAgeStatisticStudentsEducationFormControllerEvent());
    add(GetCitizenshipStudentsEducationFormControllerEvent());
    add(GetPaymentTypeStudentsEducationFormControllerEvent());
    add(GetCoursesStudentsEducationFormControllerEvent());
    add(GetResidenceStudentsEducationFormControllerEvent());
    add(GetGenderStudentsEducationFormControllerEvent());
  }


  void _getStudentsGenderData(GetGenderStudentsEducationFormControllerEvent event,emit) async{
    if(state.studentsGenderData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsGenderData:  r.reversed.toList())));
    }
  }

  void _getStudentsResidence(GetResidenceStudentsEducationFormControllerEvent event,emit) async{
    if(state.studentsResidenceData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsResidenceArea();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsResidenceData: r.reversed.toList())));
    }
  }

  void _getStudentsCoursesType(
    GetCoursesStudentsEducationFormControllerEvent event,
    emit,
  ) async {
    if(state.studentsEducationCourses.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsEducationCourses();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) =>
            emit(state.copyWith(isLoading: false, newStudentsEducationCourse: r.reversed.toList())),
      );
    }
  }

  void _getStudentsEducationPaymentType(
    GetPaymentTypeStudentsEducationFormControllerEvent event,
    emit,
  ) async {
    if(state.studentsEducationPaymentType.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsEducationPaymentType();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(
          state.copyWith(
            isLoading: false,
            newStudentsEducationPaymentType: r.reversed.toList(),
          ),
        ),
      );
    }
  }

  void _getStudentsCitizenship(
      GetCitizenshipStudentsEducationFormControllerEvent event,
    emit,
  ) async {
    if(state.studentsCitizenshipData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsCitizenshipData();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) =>
            emit(state.copyWith(isLoading: false, newStudentsCitizenshipData: r)),
      );
    }
  }

  void _getStudentsAgeStatistic(
    GetAgeStatisticStudentsEducationFormControllerEvent event,
    emit,
  ) async {

    emit(state.copyWith(isLoading: true));
    final response = await _repository.getStudentsAgeStatisticData();
    response.fold(
      (l) => emit(state.copyWith(isLoading: false)),
      (r) => emit(
        state.copyWith(isLoading: false, newStudentsAgeEducationFormData: r),
      ),
    );
  }
}
