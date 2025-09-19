import 'package:stat_edu_mobile/sources.dart';

part 'students_controller_event.dart';

part 'students_controller_state.dart';

class StudentsControllerBloc
    extends Bloc<StudentsControllerEvent, StudentsControllerState> {
  StudentsControllerBloc() : super(StudentsControllerState.empty()) {
    on<GetStudentsByGenderStudentsControllerEvent>(_getStudentsByGender);
    on<ChangeStatisticGenderStudentsControllerEvent>(_changeCategory);
    on<GetEducationCountStudentsControllerEvent>(_getStudentsEducationType);
    on<ChangeEducationCountStudentsControllerEvent>(
      _changeEducationSelectCategory,

    );
    on<GetOTMCourseStudentsControllerEvent>(_getOTMCourseStudents);
    on<ChangeOTMCourseStudentsControllerEvent>(_changeOTMCoursesCategory);
    on<GetOTMStudentsPaymentTypeStudentsControllerEvent>(
      _getOTMStudentsPaymentType,
    );
    on<ChangeOTMStudentsPaymentTypeStudentsControllerEvent>(
      _changeOTMPaymentType,
    );
    on<GetStudentsEducationFormStudentsControllerEvent>(
      _getStudentsEducationForm,
    );
    on<ChangeStudentsEducationFormStudentsControllerEvent>(
      _changeStudentsEducationFormCategory,
    );
    on<GetManyBestStudentsControllerEvent>(_getManyBestStudents);
    on<GetStatisticAgeDataStudentsControllerEvent>(
      _getStudentsAgeStatisticData,
    );
    on<GetStudentsPaymentTypeStudentsControllerEvent>(
      _getStudentsPaymentTypeData,
    );
    on<GetStudentsCoursesStatisticStudentsControllerEvent>(_getStudentsCourses);
    on<GetStudentsCitizenshipStudentsControllerEvent>(_getStudentsCitizenship);
    on<GetStudentsOtmEducationFormStudentsControllerEvent>(
      _getStudentsOtmEducationFormData,
    );
    on<GetEducationTypeStatisticStudentsControllerEvent>(_getEducationStatisticData);
  }

  final _repository = getIt<StudentsControllerRepository>();

  void _getOTMStudentsPaymentType(GetOTMStudentsPaymentTypeStudentsControllerEvent event, emit,) async {
    if(state.studentsPaymentForm.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getStudentsPaymentTypeData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsPaymentForm: r.reversed.toList()))));
    }
  }

  void _getEducationStatisticData(GetEducationTypeStatisticStudentsControllerEvent event,emit) async{
    if(state.studentsEducationTypeStatisticData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getEducationTypeStatisticData();
      response.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsEducationTypeStatisticData: r.reversed.toList())));
    }
  }

  void _getStudentsOtmEducationFormData(
    GetStudentsOtmEducationFormStudentsControllerEvent event,
    emit,
  ) async {
    if(state.studentsOtmEducationFormData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getStudentsOtmEducationFormData().then((value) => value.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(
          state.copyWith(isLoading: false, newStudentsOtmEducationFormData: r),
        ),
      ));
    }
  }

  void _getStudentsCitizenship(
    GetStudentsCitizenshipStudentsControllerEvent event,
    emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.getStudentsCitizenship();
    response.fold(

      (l) => emit(state.copyWith(isLoading: false)),
      (r) =>
          emit(state.copyWith(isLoading: false, newStudentsCitizenshipData: r)),
    );
  }

  void _getStudentsCourses(
    GetStudentsCoursesStatisticStudentsControllerEvent event,
    emit,
  ) async {

    emit(state.copyWith(isLoading: true));
    final response = await _repository.getStudentsCourse();
    response.fold(
      (l) => emit(state.copyWith(isLoading: false)),
      (r) => emit(state.copyWith(isLoading: false, newStudentsCoursesData: r)),
    );
  }

  void _getStudentsPaymentTypeData(
    GetStudentsPaymentTypeStudentsControllerEvent event,
    emit,
  ) async {
    if(state.studentsPaymentTypeStatisticData.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      await _repository.getStudentsPaymentType().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newStudentsPaymentType: r))));
    }
  }

  void _getStudentsAgeStatisticData(
    GetStatisticAgeDataStudentsControllerEvent event,
    emit,
  ) async {
    if(event.update || state.studentsByAgeStatisticData.isEmpty){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsAgeStatisticData();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(state.copyWith(isLoading: false, newAgeStatisticData: r)),
      );
    }
  }

  void _getManyBestStudents(
    GetManyBestStudentsControllerEvent event,
    emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.getManyStudentsArea();
    response.fold(
      (l) => emit(state.copyWith(isLoading: false)),
      (r) => emit(state.copyWith(isLoading: false, newManyBestStudentsArea: r)),
    );
  }

  void _changeStudentsEducationFormCategory(
    ChangeStudentsEducationFormStudentsControllerEvent event,
    emit,
  ) {
    // state.studentsEducationForm.selectCategory = event.newCategory;
    emit(state.copyWith(newStudentsEducationForm: state.studentsEducationForm));
  }

  void _getStudentsEducationForm(
    GetStudentsEducationFormStudentsControllerEvent event,
    emit,
  ) async {
    if(state.studentsEducationForm.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsEducationFormData();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) =>
            emit(state.copyWith(isLoading: false, newStudentsEducationForm: r)),
      );
    }
  }

  void _changeOTMPaymentType(
    ChangeOTMStudentsPaymentTypeStudentsControllerEvent event,
    emit,
  ) async {
    // state.studentsPayment.selectCategory = event.newCategory;
    // emit(state.copyWith(newStudentsPayment: state.studentsPayment));
  }


  void _changeOTMCoursesCategory(
    ChangeOTMCourseStudentsControllerEvent event,
    emit,
  ) {
    // state.studentsOTMCourses.selectCategory = event.categoryType;
    emit(state.copyWith(newStudentsOTMCourses: state.studentsOTMCourses));
  }

  void _getOTMCourseStudents(
    GetOTMCourseStudentsControllerEvent event,
    emit,
  ) async {
   if(state.studentsOTMCourses.isEmpty || event.update){
     emit(state.copyWith(isLoading: true));
     await _repository.getOTMStudentsCourses().then((value) => value.fold(
           (f) => emit(state.copyWith(isLoading: false)),
           (r) => emit(state.copyWith(isLoading: false, newStudentsOTMCourses: r)),
     ));
   }
  }

  void _changeEducationSelectCategory(
    ChangeEducationCountStudentsControllerEvent event,
    emit,
  ) {
    // state.studentsStatisticEducation.selectCategory = event.newCategory;
    emit(
      state.copyWith(
        newStudentsWithEducation: state.studentsStatisticEducation,
      ),
    );
  }

  void _getStudentsEducationType(
    GetEducationCountStudentsControllerEvent event,
    emit,
  ) async {
    if(state.studentsStatisticEducation.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsEducationType();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) =>
            emit(state.copyWith(isLoading: false, newStudentsWithEducation: r)),
      );
    }
  }

  void _changeCategory(
    ChangeStatisticGenderStudentsControllerEvent event,
    emit,
  ) {
    // state.studentsStatisticGender.selectCategory = event.newCategory;
    emit(state.copyWith(newStudentsWithGender: state.studentsStatisticGender));
  }

  void _getStudentsByGender(
    GetStudentsByGenderStudentsControllerEvent event,
    emit,
  ) async {
    if(state.studentsStatisticGender.isEmpty || event.update){
      emit(state.copyWith(isLoading: true));
      final response = await _repository.getStudentsCountByGender();
      response.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) => emit(state.copyWith(isLoading: false, newStudentsWithGender: r.reversed.toList())),
      );
    }
  }
}
