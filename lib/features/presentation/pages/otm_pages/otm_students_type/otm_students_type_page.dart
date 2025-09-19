import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsTypePage extends StatelessWidget {
  const OtmStudentsTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsFilterCubit, StudentsFilterState>(
      builder: (context, state) {
        if (state.showCategory) {
          return ShowOtmStudentsTypeFilterCategory();
        }

        switch (state.category) {
          case StudentsFilterCategory.education_type:
            return OtmStudentsEducationTypePage();

          case StudentsFilterCategory.education_form:
            return OtmStudentsEducationFormType();

          case StudentsFilterCategory.payment_form:
            return OtmStudentsPaymentType();

          case StudentsFilterCategory.citizenship:
            return OtmStudentsCitizenshipType();

          case StudentsFilterCategory.courses:
            return OtmStudentsCoursesType();

          case StudentsFilterCategory.age:
            return OtmStudentsAgeType();

          case StudentsFilterCategory.areas:
            return OtmStudentsResidenceType();

          case StudentsFilterCategory.areas_section:
            return OtmStudentsRegionSection();

          default:
            return Container();
        }
      },
    );
  }
}
