import 'package:stat_edu_mobile/sources.dart';

class CategoryTabbarItem extends StatelessWidget {
  String hintText;
  bool isCurrent;
  int index;
  VoidCallback onTap;

  CategoryTabbarItem({
    super.key,
    required this.hintText,
    required this.isCurrent,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<ProfessionalTabbarControllerCubit>().newIndex(index);
        onTap();
      },
      child: Container(
        width: double.maxFinite,
        // width: (MediaQuery.of(context).size.width - 32) * 0.4,
        height: 34,
        decoration: BoxDecoration(
          color: isCurrent ? AppColors.decorativeColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade400,width: 0.5),
        ),
        alignment: Alignment.center,
        child: Text(
          hintText,
          style: TextStyle(
            color: isCurrent ? Colors.white : AppColors.decorativeColor,
          ),
        ),
      ),
    );
  }
}
