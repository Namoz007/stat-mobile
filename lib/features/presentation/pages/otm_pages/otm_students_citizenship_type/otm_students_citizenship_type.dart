import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsCitizenshipType extends StatefulWidget {
  const OtmStudentsCitizenshipType({super.key});

  @override
  State<OtmStudentsCitizenshipType> createState() =>
      _OtmStudentsCitizenshipTypeState();
}

class _OtmStudentsCitizenshipTypeState
    extends State<OtmStudentsCitizenshipType> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CustomOtmContainer(child: StudentsCitizenshipGenderType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCitizenshipAgeData()),
          const SizedBox(height: 20),
          StudentsCitizenshipCoursesCitizenshipType(),
          StudentsCitizenshipCoursesCourseType(),
        ],
      ),
      onRefresh: () async {
        context.read<StudentsCitizenshipBloc>().add(UpdateStateStudentsCitizenshipEvent());
      },
    );
  }
}
