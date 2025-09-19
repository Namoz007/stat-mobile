import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCitizenshipCategoryScreen extends StatefulWidget {
  const ProfessionalCitizenshipCategoryScreen({super.key});

  @override
  State<ProfessionalCitizenshipCategoryScreen> createState() => _ProfessionalCitizenshipCategoryScreenState();
}

class _ProfessionalCitizenshipCategoryScreenState extends State<ProfessionalCitizenshipCategoryScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetCitizenshipDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      padding: EdgeInsets.only(top: 20),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        CustomOtmContainer(child: ProfessionalCitizenshipGenderData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalCitizenshipAgeData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalCitizenshipCoursesData()),
        const SizedBox(height: 20,),
        ProfessionalCitizenshipResidenceData(),
        const SizedBox(height: 20,),
      ],
    ), onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetCitizenshipDataProfessionalEducationEvent(update: true)));
  }
}
