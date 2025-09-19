import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsScreen extends StatelessWidget {
  const ProfessionalStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ShowOtmData(
                      title: AppLocalizations.of(context)!.colleges,
                      decorativeColor: AppColors.professionalDecorativeColor,
                      iconName: AppSvgs.professionalCollegeIcon,
                      count: state.educationTypeData.collegeData.allCount,
                      dataNumber: [
                        state.educationTypeData.collegeData.maleCount,
                        state.educationTypeData.collegeData.femaleCount,
                      ],
                      dataName: [
                        AppLocalizations.of(context)!.male,AppLocalizations.of(context)!.female,
                      ],
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: ShowOtmData(
                      title: AppLocalizations.of(context)!.technicalSchoolsList,
                      decorativeColor: AppColors.professionalDecorativeColor,
                      iconName: AppSvgs.professionalTechnicalCollegeIcon,
                      count: state.educationTypeData.collegeData.allCount,
                      dataNumber: [
                        state.educationTypeData.technicalCollegeData.maleCount,
                        state.educationTypeData.technicalCollegeData.femaleCount,
                      ],
                      dataName: [
                        AppLocalizations.of(context)!.male,AppLocalizations.of(context)!.female,
                      ],
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalStudentsAgeStatisticData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalStudentsPaymentData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalStudentsCourseData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalStudentsCitizenshipData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalStudentsResidenceData()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: ProfessionalStudentsEducationFormData()),
        const SizedBox(height: 10,),
      ],
    );
  }
}
