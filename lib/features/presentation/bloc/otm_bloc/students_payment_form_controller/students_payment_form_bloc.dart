import 'package:stat_edu_mobile/sources.dart';

part 'students_payment_form_event.dart';
part 'students_payment_form_state.dart';

class StudentsPaymentFormBloc
    extends Bloc<StudentsPaymentFormEvent, StudentsPaymentFormState> {
  StudentsPaymentFormBloc() : super(StudentsPaymentFormState.initialState()) {
    on<GetGenderStudentsPaymentFormEvent>(_getStudentsByGender);
    on<GetAgeStudentsPaymentFormEvent>(_getStudentsAgeStatisticData);
    on<GetCitizenshipStudentsPaymentFormEvent>(_getStudentsCitizenship);
    on<GetCoursesStudentsPaymentFormEvent>(_getStudentsCourses);
    on<GetResidenceDataStudentsPaymentFormEvent>(_getStudentsResidenceData);
    on<UpdateStateStudentsPaymentFormEvent>(_updateState);
  }

  final _repository = getIt<StudentsPaymentFormRepository>();

  void _updateState(UpdateStateStudentsPaymentFormEvent event,emit){
    emit(StudentsPaymentFormState.initialState());
    add(GetGenderStudentsPaymentFormEvent());
    add(GetAgeStudentsPaymentFormEvent());
    add(GetCitizenshipStudentsPaymentFormEvent());
    add(GetCoursesStudentsPaymentFormEvent());
    add(GetResidenceDataStudentsPaymentFormEvent());
  }

  void _getStudentsResidenceData(
    GetResidenceDataStudentsPaymentFormEvent event,
    emit,
  ) async {
    if (state.studentsResidence.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsResidenceData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(state.copyWith(isLoading: false, newStudentsResidenceData: r)),
      );
    }
  }

  void _getStudentsCourses(
    GetCoursesStudentsPaymentFormEvent event,
    emit,
  ) async {
    if(state.studentsCoursesData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsCourses();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(state.copyWith(isLoading: false, newStudentsCoursesData: r)),
      );
    }
  }

  void _getStudentsCitizenship(
    GetCitizenshipStudentsPaymentFormEvent event,
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

  void _getStudentsAgeStatisticData(
    GetAgeStudentsPaymentFormEvent event,
    emit,
  ) async {
    if(state.studentsAgeData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsAgeData();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(
          state.copyWith(
            isLoading: false,
            newStudentsByAgeData: r.reversed.toList(),
          ),
        ),
      );
    }
  }

  void _getStudentsByGender(
    GetGenderStudentsPaymentFormEvent event,
    emit,
  ) async {
    if(state.studentsByGenderData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderData();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(
          state.copyWith(
            isLoading: false,
            newStudentsByGenderData: r.reversed.toList(),
          ),
        ),
      );
    }
  }
}
