import 'package:stat_edu_mobile/sources.dart';

class ProfessionalResidenceAreaCategoryScreen extends StatefulWidget {
  const ProfessionalResidenceAreaCategoryScreen({super.key});

  @override
  State<ProfessionalResidenceAreaCategoryScreen> createState() => _ProfessionalResidenceAreaCategoryScreenState();
}

class _ProfessionalResidenceAreaCategoryScreenState extends State<ProfessionalResidenceAreaCategoryScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalEducationBloc>().add(GetResidenceAreaDataProfessionalEducationEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      padding: const EdgeInsets.only(top: 20),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        CustomOtmContainer(child: ProfessionalResidenceAreaGenderData()),
        const SizedBox(height: 20,),
        //
      ],
    ), onRefresh: () async => context.read<ProfessionalEducationBloc>().add(GetResidenceAreaDataProfessionalEducationEvent(update: true)));
  }
}
