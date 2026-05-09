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
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: AppTextStyles.hint().copyWith(fontSize: 15),
          fillColor: AppColors.background,
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 22,
          ),

          suffixIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: onFilterTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  height: 5,
                  AppAssets.filter,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}