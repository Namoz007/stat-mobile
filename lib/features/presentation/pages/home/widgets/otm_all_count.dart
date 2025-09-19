import 'package:stat_edu_mobile/sources.dart';

class OtmAllCount extends StatefulWidget {
  const OtmAllCount({super.key});

  @override
  State<OtmAllCount> createState() => _OtmAllCountState();
}

class _OtmAllCountState extends State<OtmAllCount> {

  @override
  void initState() {
    super.initState();
    context.read<OtmControllerBloc>().add(GetUniversitiesOtmControllerEvent(update: false));
    context.read<OtmControllerBloc>().add(GetProfessorsGenderOtmControllerEvent(update: false));
    context.read<OtmControllerBloc>().add(GetStudentsCountDataOtmControllerEvent(update: false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 12),child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.higherEducation,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.decorativeColor,
                fontFamily: "sfbold",
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<BaseControllerCubit>().updateScreen(1);
              },
              child: Text(
                AppLocalizations.of(context)!.all,
                style: TextStyle(
                  color: AppColors.textButtonColors,
                  fontSize: 18,
                  fontFamily: "sfbold",
                ),
              ),
            ),
          ],
        ),),
        const SizedBox(height: 7),
        BlocBuilder<OtmControllerBloc, OtmControllerState>(
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShowOtmType(
                    gradientColors: [
                      Color(0xFF88C0FF),
                      Color(0xFF88C0FF),
                      Color(0xFF84C651),
                    ],
                    title: AppLocalizations.of(context)!.numberOfHigherEducationInstitutions,
                    count: state.universities.length,
                    iconName: AppIcons.otmIcon,
                    iconWidth: 61,
                    iconHeight: 36,
                  ),
                  ShowOtmType(
                    gradientColors: [
                      Colors.blueAccent,
                      Colors.blueAccent,
                    ],
                    title: AppLocalizations.of(context)!.numberOfProfessors,
                    count: state.professorsGenderData.isEmpty ? 0 : state.professorsGenderData.map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b),
                    iconName: AppIcons.otmProfessorIcon,
                    iconWidth: 45,
                    iconHeight: 36,
                  ),
                  ShowOtmType(
                    gradientColors: [
                      Color(0xFF8e59de),
                      Color(0xFF6881bf),
                    ],
                    title: AppLocalizations.of(context)!.numberOfStudents,
                    count: state.studentsCountData.isEmpty ? 0 : state.studentsCountData.map((value) => value.count).toList().reduce((a,b) => a + b),
                    iconName: AppIcons.otmStudentsIcon,
                    iconWidth: 37.5,
                    iconHeight: 30,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
