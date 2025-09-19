import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsInstitutionOwnershipCategory extends StatelessWidget {
  const ProfessionalStudentsInstitutionOwnershipCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ProfessionalInstitutionControllerCubit,
      ProfessionalInstitutionControllerState
    >(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.decorativeColor),
              borderRadius: BorderRadius.circular(10),
              color: AppColors.decorativeColor
          ),
          child: DropdownButton(
            isDense: true,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const SizedBox.shrink(),
            dropdownColor: AppColors.decorativeColor,
            value: state.ownershipCategory,
            items: List.generate(professionalOwnershipCategoryList.length, (
              index,
            ) {
              return DropdownMenuItem(
                value: professionalOwnershipCategoryList[index],
                child: Text(
                  getTranslateWord(context: context, value: getProfessionalInstitutionCategoryName(
                    professionalOwnershipCategoryList[index],
                  )),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,overflow: TextOverflow.ellipsis),
                ),
              );
            }),
            onChanged: (value) {
              if(value != null){
                context.read<ProfessionalInstitutionControllerCubit>().newOwnershipCategory(value);
              }
            },
          ),
        );
      },
    );
  }
}
