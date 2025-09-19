import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsCoursesType extends StatefulWidget {
  const OtmStudentsCoursesType({super.key});

  @override
  State<OtmStudentsCoursesType> createState() => _OtmStudentsCoursesTypeState();
}

class _OtmStudentsCoursesTypeState extends State<OtmStudentsCoursesType> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CustomOtmContainer(child: StudentsCoursesGenderData()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCoursesAgeData()),
          const SizedBox(height: 20),
          StudentsCoursesResidenceData(),
        ],
      ),
      onRefresh: () async {
        context.read<StudentsCoursesBloc>().add(UpdateStateStudentsCourseEvent());
      },
    );
  }
}
