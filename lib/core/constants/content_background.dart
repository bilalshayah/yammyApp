import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../../features/home/presentation/pages/home_page.dart';

class ContentBackground extends StatelessWidget {
  const ContentBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          HomePage(),
          Container(
            color: AppColors.orange2.withOpacity(0.6),
            width: double.infinity,
            height: double.infinity,
          ),
        ]);
  }
}