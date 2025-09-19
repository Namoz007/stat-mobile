import 'package:stat_edu_mobile/sources.dart';

class ProfessionalPaymentFormCategoryScreen extends StatefulWidget {
  const ProfessionalPaymentFormCategoryScreen({super.key});

  @override
  State<ProfessionalPaymentFormCategoryScreen> createState() => _ProfessionalPaymentFormCategoryScreenState();
}

class _ProfessionalPaymentFormCategoryScreenState extends State<ProfessionalPaymentFormCategoryScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetPaymentFormDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          CustomOtmContainer(child: ProfessionalPaymentFormGenderData()),
          const SizedBox(height: 20,),
          CustomOtmContainer(child: ProfessionalPaymentFormAgeData()),
          const SizedBox(height: 20,),
          CustomOtmContainer(child: ProfessionalPaymentFormCitizenshipData()),
          const SizedBox(height: 20,),
          CustomOtmContainer(child: ProfessionalPaymentFormCourseData()),
          const SizedBox(height: 20,),
          CustomOtmContainer(child: ProfessionalPaymentFormResidenceData()),
          const SizedBox(height: 20,),
        ],
      ),
      onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetPaymentFormDataProfessionalEducationEvent(update: true))
    );
  }
}
