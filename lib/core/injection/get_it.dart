import 'package:stat_edu_mobile/sources.dart';

final getIt = GetIt.instance;

Future<void> setUpGetItItems() async{
  final pref = await SharedPreferences.getInstance();

  ///Local Storage providers
  getIt.registerSingleton(pref);


  ///Network provider
  getIt.registerSingleton(DioFile());

  ///Data Sources
  getIt.registerSingleton(OtmControllerDataSource());
  getIt.registerSingleton(ProfessionalControllerDataSources());
  getIt.registerSingleton(AcceptanceControllerDataSource());
  getIt.registerSingleton(StudentsControllerDataSource());
  getIt.registerSingleton(TeachersControllerDataSource());
  getIt.registerSingleton(StudentsEducationFormDataSource());
  getIt.registerSingleton(StudentsPaymentFormDataSource());
  getIt.registerSingleton(StudentsCitizenshipDataSource());
  getIt.registerSingleton(StudentsCoursesDataSource());
  getIt.registerSingleton(StudentsAgeResidenceDataSource());
  getIt.registerSingleton(StudentsRegionSectionDataSource());
  getIt.registerSingleton(DoctoralStudiesDataSource());

  ///Repositories
  getIt.registerSingleton(OtmControllerRepositoryImpl());
  getIt.registerSingleton(ProfessionalControllerRepositoryImpl());
  getIt.registerSingleton(AcceptanceControllerRepositoryImpl());
  getIt.registerSingleton(StudentsControllerRepository());
  getIt.registerSingleton(TeachersControllerRepository());
  getIt.registerSingleton(StudentsEducationFormControllerRepository());
  getIt.registerSingleton(StudentsPaymentFormRepository());
  getIt.registerSingleton(StudentsCitizenshipRepository());
  getIt.registerSingleton(StudentsCoursesRepository());
  getIt.registerSingleton(StudentsAgeResidenceRepository());
  getIt.registerSingleton(StudentsRegionSectionRepository());
  getIt.registerSingleton(DoctoralStudiesRepository());

  ///Blocs
  getIt.registerSingleton(OtmControllerBloc());
  getIt.registerSingleton(BaseControllerCubit());
  getIt.registerSingleton(ProfessionalEducationBloc());
  getIt.registerSingleton(AcceptanceControllerCubit());
  getIt.registerFactory(() => ProfessionalTabbarControllerCubit());
  getIt.registerSingleton(UniversityDataCubit());
  getIt.registerSingleton(UrlLaunchCubit());
  getIt.registerSingleton(StudentsControllerBloc());
  getIt.registerSingleton(OtmDataControllerCubit());
  getIt.registerSingleton(TeachersControllerBloc());
  getIt.registerFactory<StudentsFilterCubit>(() => StudentsFilterCubit());
  getIt.registerSingleton(StudentsEducationFormControllerBloc());
  getIt.registerSingleton(StudentsPaymentFormBloc());
  getIt.registerSingleton(StudentsCitizenshipBloc());
  getIt.registerSingleton(StudentsCoursesBloc());
  getIt.registerSingleton(StudentsAgeResidenceBloc());
  getIt.registerSingleton(StudentsRegionSectionBloc());
  getIt.registerSingleton(OtmTitleCategoryControllerCubit());
  getIt.registerFactory(() => OtmCategoryControllerCubit());
  getIt.registerSingleton(ProfessionalInstitutionControllerCubit());
  getIt.registerSingleton(DoctoralStudiesFilterCubit());
  getIt.registerSingleton(DoctoralStudiesControllerBloc());
  getIt.registerSingleton(AcceptanceFilterCategoryCubit());
  getIt.registerSingleton(LanguageControllerCubit());
}