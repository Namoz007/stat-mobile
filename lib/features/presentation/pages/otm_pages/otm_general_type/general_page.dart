import 'package:stat_edu_mobile/sources.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const ScrollPhysics(),
        children: [
          BlocBuilder<OtmControllerBloc,OtmControllerState>(builder: (context,state){
            Map<String,int> _otmDataTyep = {
              AppLocalizations.of(context)!.foreign: 13,
              AppLocalizations.of(context)!.nonGovernmental: 12,
              AppLocalizations.of(context)!.governmental: 11,
            };

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShowOtmData(
                    title: AppLocalizations.of(context)!.numberOfHigherEducationInstitutions,
                    decorativeColor: AppColors.decorativeColor,
                    iconName: AppSvgs.otmIconData,
                    count: state.universities.length,
                    dataNumber: _otmDataTyep.values.toList().map((value) => state.universities.where((v) => v.ownershipForm == value).toList().length).toList(),
                    dataName: _otmDataTyep.keys.toList(),
                    backgroundColor: Colors.white,
                    showLine: true,
                  ),
                  const SizedBox(height: 11,),
                  ShowOtmData(
                    title: AppLocalizations.of(context)!.numberOfProfessors,
                    decorativeColor: AppColors.decorativeColor,
                    iconName: AppSvgs.professorsIconData,
                    count: state.professorsGenderData.isNotEmpty ? state.professorsGenderData.map((value) => value.femaleCount + value.maleCount).toList().reduce((a,b) => a + b) : 0,
                    dataNumber: state.professorsGenderData.isNotEmpty ? [
                      state.professorsGenderData.map((value) => value.maleCount).toList().reduce((a,b) => a + b),
                      state.professorsGenderData.map((value) => value.femaleCount).toList().reduce((a,b) => a + b),
                    ] : [0,0],
                    dataName: [AppLocalizations.of(context)!.male, AppLocalizations.of(context)!.female],
                    backgroundColor: Colors.white,
                    showLine: true,
                  ),
                  const SizedBox(height: 11),
                  ShowOtmData(
                    title: AppLocalizations.of(context)!.numberOfStudents,
                    decorativeColor: AppColors.decorativeColor,
                    iconName: AppSvgs.studentsIconData,
                    count: state.studentsCountData.isNotEmpty ? state.studentsCountData.map((value) => value.count).toList().reduce((a,b) => a + b) : 0,
                    dataNumber: state.studentsCountData.isNotEmpty ? state.studentsCountData.map((value) => value.eduType).toSet().toList().map((value) => state.studentsCountData.where((v) => v.eduType == value).toList().map((i) => i.count).toList().reduce((a,b) => a + b)).toList() : [],
                    dataName: state.studentsCountData.isNotEmpty ? state.studentsCountData.map((value) => value.eduType).toSet().toList() : [],
                    backgroundColor: Colors.white,
                    showLine: true,
                  ),
                ],
              ),
            );
          },),
          const SizedBox(height: 20),
          CustomOtmContainer(child: ShowOtmOrganizationalType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsGenderType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCountEducationType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCoursesType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsPaymentType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCountEducationFormType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsEducationOtmFormArea()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsLocationTop5Area()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsManyBestArea()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsPermanentResidenceRegion()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: TopFiveManyStudentsUniversities()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsCountOtmOwnershipType()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: ProfessorAndTeacherGenderType()),
          const SizedBox(height: 10),
        ],
      ),
      onRefresh: () async {
        context.read<OtmControllerBloc>().add(UpdateStateOtmControllerEvent());
        context.read<TeachersControllerBloc>().add(GetProfessorsGenderDataTeachersControllerEvent(update: true));
      },
    );
  }
}
