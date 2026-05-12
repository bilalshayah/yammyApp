import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yammyapp/core/constants/constants.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onFilterTap;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: AppTextStyles.hint(),
        fillColor: AppColors.background,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(size.width * 0.08),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
            vertical: size.height * 0.004,
          ),
          child: GestureDetector(
            onTap: onFilterTap,
            child: Container(
              width: size.width * 0.055,
              height: size.width * 0.055,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: SvgPicture.asset(
                  AppAssets.filter,
                  colorFilter: const ColorFilter.mode(
                    AppColors.background,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
