import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/svg_icon.dart';

class IconContainer extends StatelessWidget {
  final Color? color;
  final String path;
  final double? radius;

  const IconContainer({this.color,required this.path,this.radius,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color ?? AppColors.orange2,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 16))
      ),
      child: SvgIcon(path: path),
    );
  }
}
