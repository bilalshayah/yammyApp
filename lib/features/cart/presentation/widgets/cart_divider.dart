import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CartDivider extends StatelessWidget {
  const CartDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
        thickness: 1.5,
        color: AppColors.orange2,
        indent: 3,
        endIndent: 3
    );
  }
}
