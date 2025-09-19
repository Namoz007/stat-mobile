import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsEducationTypeCategory extends StatelessWidget {
  const ProfessionalStudentsEducationTypeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ProfessionalInstitutionControllerCubit,
      ProfessionalInstitutionControllerState
    >(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(bottom: 5, top: 5, left: 5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.decorativeColor),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.decorativeColor,
          ),
          child: DropdownButton(
            isDense: true,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const SizedBox.shrink(),
            dropdownColor: AppColors.decorativeColor,
            value: state.educationTypeCategory,
            items: List.generate(professionalEducationTypeCategoryList.length, (index,) {
              return DropdownMenuItem(
                value: professionalEducationTypeCategoryList[index],
                child: Text(
                  getTranslateWord(
                    context: context,
                    value: getEducationTypeCategoryName(
                      professionalEducationTypeCategoryList[index],
                    ),
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }),
            onChanged: (value) {
              if (value != null) {
                context
                    .read<ProfessionalInstitutionControllerCubit>()
                    .newEducationCategory(value);
              }
            },
          ),
        );
      },
    );
  }
}
