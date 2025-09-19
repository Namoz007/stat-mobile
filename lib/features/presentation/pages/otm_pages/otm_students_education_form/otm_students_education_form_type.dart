import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsEducationFormType extends StatefulWidget {
  const OtmStudentsEducationFormType({super.key});

  @override
  State<OtmStudentsEducationFormType> createState() =>
      _OtmStudentsEducationFormTypeState();
}

class _OtmStudentsEducationFormTypeState extends State<OtmStudentsEducationFormType> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CustomOtmContainer(child: StudentsByGenderEductionType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsByAgeEducationForm()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsEducationCitizenshipType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsEducationPaymentType()),
          const SizedBox(height: 20),
          StudentsEducationCoursesType(),
          StudentsEducationResidenceAreaType(),
        ],
      ),
      onRefresh: () async {
        context.read<StudentsEducationFormControllerBloc>().add(UpdateStateStudentsEducationFormControllerEvent());
        
      },
    );
  }
}
