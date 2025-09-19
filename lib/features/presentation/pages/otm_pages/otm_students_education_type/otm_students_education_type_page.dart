import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsEducationTypePage extends StatefulWidget {
  const OtmStudentsEducationTypePage({super.key});

  @override
  State<OtmStudentsEducationTypePage> createState() =>
      _OtmStudentsEducationTypePageState();
}

class _OtmStudentsEducationTypePageState
    extends State<OtmStudentsEducationTypePage> {

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          StudentsMenuStatistics(),
          const SizedBox(height: 12),
          CustomOtmContainer(child: StudentsPaymentType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsByAgeStatistic()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsPaymentStatisticTypePage()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCourseStatisticType()),
          const SizedBox(height: 20),
          StudentsCourseDegreeType(),
          CustomOtmContainer(child: StudentsCitizenshipFormType()),
          const SizedBox(height: 20),
          StudentsEducationFormType(),
        ],
      ),
      onRefresh: () async {
        ///
      },
    );
  }
}
