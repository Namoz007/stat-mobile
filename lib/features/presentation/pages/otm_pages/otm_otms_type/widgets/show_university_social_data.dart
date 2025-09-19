import 'package:stat_edu_mobile/sources.dart';

class ShowUniversitySocialData extends StatelessWidget {
  UniversityEntity data;

  ShowUniversitySocialData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.address}:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.addressTextColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        data.address,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: AppColors.addressTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: (){
                  context.read<UrlLaunchCubit>().launchUrl(data.location);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 9,
                    bottom: 9,
                    right: 28,
                    left: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(AppSvgs.routeIcon),
                      const SizedBox(width: 5),
                      Text(
                        AppLocalizations.of(context)!.route,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          AppLocalizations.of(context)!.officialSocialMedia,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.addressTextColor,
          ),
        ),
        Divider(color: AppColors.addressTextColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(child: SvgPicture.asset(AppSvgs.instagramIcon),onTap: () => context.read<UrlLaunchCubit>().launchUrl(data.instagram),),
            GestureDetector(child: SvgPicture.asset(AppSvgs.facebookIcon),onTap: () => context.read<UrlLaunchCubit>().launchUrl(data.facebook),),
            GestureDetector(child: SvgPicture.asset(AppSvgs.telegramIcon),onTap: () => context.read<UrlLaunchCubit>().launchUrl(data.telegram),),
            GestureDetector(child: SvgPicture.asset(AppSvgs.youtubeIcon),onTap: () => context.read<UrlLaunchCubit>().launchUrl(data.youtube),),
          ],
        ),
        const SizedBox(height: 16,)
      ],
    );
  }
}
