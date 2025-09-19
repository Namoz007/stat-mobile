import 'package:stat_edu_mobile/sources.dart';
class CustomOtmContainer extends StatelessWidget {
  Widget child;
  CustomOtmContainer({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(top: 20, left: 16, right: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Color(0xFF919191), width: 0.4),
      ),
      child: child,
    );
  }
}
