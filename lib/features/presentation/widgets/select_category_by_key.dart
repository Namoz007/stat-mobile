import 'package:stat_edu_mobile/sources.dart';

class SelectCategoryByKey extends StatelessWidget {
  String title;
  VoidCallback rightOnTap;
  VoidCallback leftOnTap;

  SelectCategoryByKey({
    super.key,
    required this.title,
    required this.rightOnTap,
    required this.leftOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: leftOnTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, offset: Offset(3, 0)),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.decorativeLightColor,
              ),
              child: SvgPicture.asset(AppSvgs.arrowLeftIcon),
            ),
          ),
        ),
        Text(
          getTranslateWord(context: context, value: title),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.decorativeTextColor,
          ),
        ),
        InkWell(
          onTap: rightOnTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, offset: Offset(-3, 0)),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.decorativeLightColor,
              ),
              child: SvgPicture.asset(AppSvgs.arrowRightIcon),
            ),
          ),
        ),
      ],
    );
  }
}
