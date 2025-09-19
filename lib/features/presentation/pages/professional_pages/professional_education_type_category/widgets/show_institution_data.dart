import 'package:stat_edu_mobile/sources.dart';

class ShowInstitutionData extends StatelessWidget {
  ProfessionalInstitutionEntity data;

  ShowInstitutionData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 14, right: 13, left: 13, bottom: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: Colors.black, width: 0.1),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        data.ownership_form == 11
                            ? AppColors.mainColor
                            : data.ownership_form == 12
                            ? AppColors
                                .professionalNonGovernmentalInstitutionColor
                            : AppColors.professionalForeignInstitutionColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  data.ownership_form == 11
                      ? AppLocalizations.of(context)!.governmental
                      : data.ownership_form == 12
                      ? AppLocalizations.of(context)!.nonGovernmental
                      : AppLocalizations.of(context)!.foreign,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        data.ownership_form == 11
                            ? AppColors.mainColor
                            : data.ownership_form == 12
                            ? AppColors
                                .professionalNonGovernmentalInstitutionColor
                            : AppColors.professionalForeignInstitutionColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        data.education_type == 5
                            ? AppColors.circleStatisticBlueChart
                            : data.education_type == 4
                            ? AppColors.amberCircleChartColor
                            : AppColors.professionalJobInstitutionColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  data.education_type == 5
                      ? AppLocalizations.of(context)!.technicalSchool
                      : data.education_type == 4
                      ? AppLocalizations.of(context)!.college
                      : AppLocalizations.of(context)!.vocationalSchool,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        data.education_type == 5
                            ? AppColors.circleStatisticBlueChart
                            : data.education_type == 4
                            ? AppColors.amberCircleChartColor
                            : AppColors.professionalJobInstitutionColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppSvgs.professionalInstitutionIcon),
              Expanded(
                child: BlocBuilder<
                  LanguageControllerCubit,
                  LanguageControllerState
                >(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        state.language == "en"
                            ? data.name_en
                            : state.language == "uz"
                            ? data.name_uz
                            : data.name_ru,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
