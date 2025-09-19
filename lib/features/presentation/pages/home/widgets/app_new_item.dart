import 'package:stat_edu_mobile/sources.dart';

class AppNewItem extends StatelessWidget {
  const AppNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(4),
      width: 105,
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(width: 2, color: Color(0xFFEA92BA)),
      ),
      child: Image.asset(AppImages.appNewsImage),
    );
  }
}
