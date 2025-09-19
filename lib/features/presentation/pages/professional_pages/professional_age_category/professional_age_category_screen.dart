import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAgeCategoryScreen extends StatefulWidget {
  const ProfessionalAgeCategoryScreen({super.key});

  @override
  State<ProfessionalAgeCategoryScreen> createState() => _ProfessionalAgeCategoryScreenState();
}

class _ProfessionalAgeCategoryScreenState extends State<ProfessionalAgeCategoryScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetAgeDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 20),
      children: [
        CustomOtmContainer(child: ProfessionalAgeGenderData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalResidenceData()),
        const SizedBox(height: 20,),
      ],
    ), onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetAgeDataProfessionalEducationEvent(update: true)));
  }
}
