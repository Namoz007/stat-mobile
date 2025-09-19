
import 'sources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetItItems();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<OtmControllerBloc>()),
        BlocProvider(create: (context) => getIt<BaseControllerCubit>()),
        BlocProvider(create: (context) => getIt<ProfessionalEducationBloc>()),
        BlocProvider(create: (context) => getIt<AcceptanceControllerCubit>()),
        BlocProvider(create: (context) => getIt<UniversityDataCubit>()),
        BlocProvider(create: (context) => getIt<UrlLaunchCubit>()),
        BlocProvider(create: (context) => getIt<StudentsControllerBloc>()),
        BlocProvider(create: (context) => getIt<OtmDataControllerCubit>()),
        BlocProvider(create: (context) => getIt<TeachersControllerBloc>()),
        BlocProvider(create: (context) => getIt<StudentsEducationFormControllerBloc>()),
        BlocProvider(create: (context) => getIt<StudentsPaymentFormBloc>()),
        BlocProvider(create: (context) => getIt<StudentsCitizenshipBloc>()),
        BlocProvider(create: (context) => getIt<StudentsCoursesBloc>()),
        BlocProvider(create: (context) => getIt<StudentsAgeResidenceBloc>()),
        BlocProvider(create: (context) => getIt<StudentsRegionSectionBloc>()),
        BlocProvider(create: (context) => getIt<OtmTitleCategoryControllerCubit>()),
        BlocProvider(create: (context) => getIt<ProfessionalInstitutionControllerCubit>()),
        BlocProvider(create: (context) => getIt<DoctoralStudiesFilterCubit>()),
        BlocProvider(create: (context) => getIt<DoctoralStudiesControllerBloc>()),
        BlocProvider(create: (context) => getIt<LanguageControllerCubit>()),
      ],
      child: BlocBuilder<LanguageControllerCubit, LanguageControllerState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(state.language),
            supportedLocales: [
              Locale("en"),
              Locale("uz"),
              Locale("ru"),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: AppThemeMode.lightMode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}