import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsRegionSection extends StatefulWidget {
  const OtmStudentsRegionSection({super.key});

  @override
  State<OtmStudentsRegionSection> createState() =>
      _OtmStudentsRegionSectionState();
}

class _OtmStudentsRegionSectionState extends State<OtmStudentsRegionSection> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CustomOtmContainer(child: StudentsRegionSectionGenderData()),
          const SizedBox(height: 20),
          StudentsRegionSectionEducationType(),
          CustomOtmContainer(child: StudentsRegionSectionAgeData()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsRegionSectionPaymentForm()),
          const SizedBox(height: 20),
          StudentsRegionSectionCoursesData(),
          StudentsRegionSectionCitizenshipData(),
          StudentsRegionSectionResidenceData(),
          StudentsRegionSectionEducationFormData(),
          const SizedBox(height: 20),
        ],
      ),
      onRefresh: () async {
        context.read<StudentsRegionSectionBloc>().add(UpdateStateStudentsRegionSectionEvent());
        
      },
    );
  }
}
