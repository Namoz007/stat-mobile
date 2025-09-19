import 'package:stat_edu_mobile/sources.dart';

class UniversityTitleData extends StatelessWidget {
  UniversityEntity data;

  UniversityTitleData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppIcons.defaultUniversityLogo),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: BlocBuilder<LanguageControllerCubit,LanguageControllerState>(
            builder: (context, state) {
              return Text(
                state.language == "en" ? data.nameEn : state.language == "uz" ? data.nameUz : data.nameRu,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.mainColor,
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        BlocBuilder<UniversityDataCubit, UniversityDataState>(
          builder: (context, state) {
            return universityCubitDataController(state.universities, data.id)
                ? const SizedBox()
                : GestureDetector(
              onTap: () {
                context.read<UniversityDataCubit>().addNetUniversity(data);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: -6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.details,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF6DA966),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(AppSvgs.downIcon),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
