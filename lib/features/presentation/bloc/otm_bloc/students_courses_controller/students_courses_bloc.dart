import 'package:stat_edu_mobile/sources.dart';
part 'students_courses_event.dart';
part 'students_courses_state.dart';

class StudentsCoursesBloc extends Bloc<StudentsCourseEvent,StudentsCoursesState>{
  StudentsCoursesBloc() : super(StudentsCoursesState.initialState()){
    on<GetGenderStudentsCourseEvent>(_getGenderStudentsData);
    on<GetAgeStudentsCourseEvent>(_getAgeStudentsData);
    on<GetResidenceStudentsCourseEvent>(_getResidenceStudentsData);
    on<UpdateStateStudentsCourseEvent>(_updateState);
  }

  final _repository = getIt<StudentsCoursesRepository>();

  void _updateState(UpdateStateStudentsCourseEvent event,emit){
    emit(StudentsCoursesState.initialState());
    add(GetGenderStudentsCourseEvent());
    add(GetAgeStudentsCourseEvent());
    add(GetResidenceStudentsCourseEvent());
  }

  void _getGenderStudentsData(GetGenderStudentsCourseEvent event,emit) async{
    if(state.studentsByGender.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsGenderData: r.reversed.toList())));
    }
  }

  void _getAgeStudentsData(GetAgeStudentsCourseEvent event,emit) async{
    if(state.studentsByAge.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsAgeData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsAgeData: r.reversed.toList())));
    }
  }

  void _getResidenceStudentsData(GetResidenceStudentsCourseEvent event,emit) async{
    if(state.studentsByResidence.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsResidenceData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsResidenceData: r)));
    }
  }
}
