import 'package:stat_edu_mobile/sources.dart';
class ProfessionalEducationFormScreen extends StatefulWidget {
  const ProfessionalEducationFormScreen({super.key});

  @override
  State<ProfessionalEducationFormScreen> createState() => _ProfessionalEducationFormScreenState();
}

class _ProfessionalEducationFormScreenState extends State<ProfessionalEducationFormScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetEducationFormDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        CustomOtmContainer(child: ProfessionalEducationFormGenderData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalEducationFormAgeData()),
        const SizedBox(height: 20,),
        ProfessionalEducationFormCitizenshipData(),
        CustomOtmContainer(child: ProfessionalEducationFormPaymentFormData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalEducationFormCoursesData()),
        const SizedBox(height: 20,),
        ProfessionalEducationFormResidenceData(),
      ],
    ), onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetEducationFormDataProfessionalEducationEvent(update: true)));
  }
}
