import 'package:stat_edu_mobile/sources.dart';

part 'students_citizenship_event.dart';

part 'students_citizenship_state.dart';

class StudentsCitizenshipBloc
    extends Bloc<StudentsCitizenshipEvent, StudentsCitizenshipState> {
  StudentsCitizenshipBloc() : super(StudentsCitizenshipState.initialState()) {
    on<GetGenderStudentsCitizenshipEvent>(_getStudentsGenderData);
    on<GetAgeStudentsCitizenshipEvent>(_getAgeStudentsData);
    on<GetCoursesStudentsCitizenshipEvent>(_getCoursesData);
    on<UpdateStateStudentsCitizenshipEvent>(_updateState);
  }

  final _repository = getIt<StudentsCitizenshipRepository>();

  void _updateState(UpdateStateStudentsCitizenshipEvent event,emit){
    emit(StudentsCitizenshipState.initialState());
    add(GetGenderStudentsCitizenshipEvent());
    add(GetAgeStudentsCitizenshipEvent());
    add(GetCoursesStudentsCitizenshipEvent());
  }

  void _getCoursesData(GetCoursesStudentsCitizenshipEvent event, emit) async {
    if (state.studentsCoursesData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsCoursesData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(
          state.copyWith(
            isLoading: false,
            newStudentsCoursesData: r,
          ),
        ),
      );
    }
  }

  void _getAgeStudentsData(GetAgeStudentsCitizenshipEvent event, emit) async {
    if (state.studentsAgeData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsAgeData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(
          state.copyWith(
            isLoading: false,
            newStudentsAgeData: r.reversed.toList(),
          ),
        ),
      );
    }
  }

  void _getStudentsGenderData(
    GetGenderStudentsCitizenshipEvent event,
    emit,
  ) async {
    if (state.studentsGenderData.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderData();
      response.fold(
        (l) => emit(state.copyWith(isLoading: false)),
        (r) => emit(
          state.copyWith(
            isLoading: false,
            newStudentsGenderData: r.reversed.toList(),
          ),
        ),
      );
    }
  }
}
