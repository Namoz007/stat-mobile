import 'package:stat_edu_mobile/sources.dart';
class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ///
      },
      child: Container(
        width: 48,
        height: 41,
        margin: const EdgeInsets.symmetric(horizontal: 21),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.decorativeColor,width: 1)
        ),
        child: SvgPicture.asset(AppSvgs.filterIcon),
      ),
    );
  }
}
