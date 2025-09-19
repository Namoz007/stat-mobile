import 'package:stat_edu_mobile/sources.dart';
part 'students_age_residence_event.dart';

part 'students_age_residence_state.dart';

class StudentsAgeResidenceBloc
    extends Bloc<StudentsAgeResidenceEvent, StudentsAgeResidenceState> {
  StudentsAgeResidenceBloc() : super(StudentsAgeResidenceState.initialState()){
    on<GetGenderForResidenceStudentsAgeResidenceEvent>(_getStudentsGenderForResidenceType);
    on<GetGenderStudentsAgeResidenceEvent>(_getGenderStudentsData);
    on<GetResidenceStudentsAgeResidenceEvent>(_getStudentsResidenceData);
    on<UpdateStateStudentsAgeResidenceEvent>(_updateState);
  }
  final _repository = getIt<StudentsAgeResidenceRepository>();

  void _updateState(UpdateStateStudentsAgeResidenceEvent event,emit){
    emit(StudentsAgeResidenceState.initialState());
    add(GetGenderStudentsAgeResidenceEvent());
    add(GetResidenceStudentsAgeResidenceEvent());
    add(GetGenderForResidenceStudentsAgeResidenceEvent());
  }

  void _getStudentsGenderForResidenceType(GetGenderForResidenceStudentsAgeResidenceEvent event,emit) async{
    if(state.studentsGenderForResidence.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderForResidenceData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsGenderForResidence: r.reversed.toList())));
    }
  }

  void _getGenderStudentsData(GetGenderStudentsAgeResidenceEvent event,emit) async{
    if(state.studentsGenderData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsGenderData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsGenderData: r.reversed.toList())));
    }
  }

  void _getStudentsResidenceData(GetResidenceStudentsAgeResidenceEvent event,emit) async{
    if(state.studentsResidenceData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsResidenceData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsResidence: r)));
    }
  }
}
