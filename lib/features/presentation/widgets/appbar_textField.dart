import 'package:stat_edu_mobile/sources.dart';

class AppbarTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  String suffixIconSvg;
  VoidCallback onTap;

  AppbarTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIconSvg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.decorativeColor),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(suffixIconSvg),
        ),
      ),
    );
  }
}
