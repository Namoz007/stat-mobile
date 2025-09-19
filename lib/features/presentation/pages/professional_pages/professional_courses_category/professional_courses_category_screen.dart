import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCoursesCategoryScreen extends StatefulWidget {
  const ProfessionalCoursesCategoryScreen({super.key});

  @override
  State<ProfessionalCoursesCategoryScreen> createState() => _ProfessionalCoursesCategoryScreenState();
}

class _ProfessionalCoursesCategoryScreenState extends State<ProfessionalCoursesCategoryScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetCoursesDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 20),
      shrinkWrap: true,
      children: [
        CustomOtmContainer(child: ProfessionalCoursesGenderData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalCoursesAgeData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalCoursesResidenceData()),
        const SizedBox(height: 20,),
      ],
    ), onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetCoursesDataProfessionalEducationEvent(update: true)));
  }
}
