import 'package:stat_edu_mobile/sources.dart';
class ShowOtmCategory extends StatelessWidget {
  String categoryTitle;
  Color backgroundColor;
  Color titleColor;
  VoidCallback onTap;

  ShowOtmCategory({
    super.key,
    required this.categoryTitle,
    required this.backgroundColor,
    required this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          categoryTitle,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
