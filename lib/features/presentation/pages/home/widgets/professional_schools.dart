import 'package:stat_edu_mobile/sources.dart';

class ProfessionalSchools extends StatefulWidget {
  const ProfessionalSchools({super.key});

  @override
  State<ProfessionalSchools> createState() => _ProfessionalSchoolsState();
}

class _ProfessionalSchoolsState extends State<ProfessionalSchools> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetStudentsDataProfessionalEducationEvent(update: false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ProfessionalEducationBloc,
      ProfessionalEducationState
    >(
      builder: (context, state) {
        return Row(
          children: [
            ShowProfessionalType(
              gradientColors: [Colors.grey.shade500,Colors.grey.shade500,],
              title: AppLocalizations.of(context)!.colleges,
              count: state.educationTypeData.collegeData.allCount,
              iconName: AppSvgs.collegeIcon,
            ),
            ShowProfessionalType(
              gradientColors: [Colors.pinkAccent.shade700, Colors.pinkAccent.shade400],
              title: AppLocalizations.of(context)!.technicalSchools,
              count: state.educationTypeData.technicalCollegeData.allCount,
              iconName: AppSvgs.technicalSchoolIcon,
            ),
          ],
        );
      },
    );
  }
}
