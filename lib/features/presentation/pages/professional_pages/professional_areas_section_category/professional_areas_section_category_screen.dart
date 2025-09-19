import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionCategoryScreen extends StatefulWidget {
  const ProfessionalAreasSectionCategoryScreen({super.key});

  @override
  State<ProfessionalAreasSectionCategoryScreen> createState() => _ProfessionalAreasSectionCategoryScreenState();
}

class _ProfessionalAreasSectionCategoryScreenState extends State<ProfessionalAreasSectionCategoryScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetAreasSectionDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.only(top: 20),
      shrinkWrap: true,
      children: [
        CustomOtmContainer(child: ProfessionalAreasSectionGenderData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalAreasSectionEducationTypeData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalAreasSectionAgeData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalAreasSectionPaymentFormData()),
        const SizedBox(height: 20,),
        ProfessionalAreasSectionCoursesData(),
        ProfessionalAreasSectionCitizenshipData(),
        ProfessionalAreasSectionResidenceData(),
        ProfessionalAreasSectionEducationFormData(),
      ],
    ), onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetAreasSectionDataProfessionalEducationEvent(update: true)));
  }
}
