import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yum_quick/core/constants/appTextStyle.dart';
import 'package:yum_quick/core/constants/app_assets.dart';
import 'package:yum_quick/core/constants/app_colors.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String type;

  const CustomField({super.key, required this.controller, required this.type});
  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isShowed = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: (widget.type.toLowerCase() == "email")
          ? TextInputType.emailAddress
          : (widget.type.toLowerCase() == "password")
          ? TextInputType.visiblePassword
          : TextInputType.numberWithOptions(),
      obscureText: (widget.type.toLowerCase()=="password")? !isShowed : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        hint: (widget.type.toLowerCase() == "password")
            ? Text("*************")
            : (widget.type.toLowerCase() == "email")
            ? Text("example@example.com")
            : Text("+ 123 456 789"),
        hintStyle: AppTextStyles.hint,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(13),
        ),
        fillColor: Color(0xffF3E9B5),
        filled: true,
        suffixIcon: (widget.type.toLowerCase() == "password")
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowed = !isShowed;
                    });
                  },
                  child: SvgPicture.asset(
                    isShowed ? AppAssets.eye : AppAssets.eye_off,
                    color: AppColors.primary,
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
