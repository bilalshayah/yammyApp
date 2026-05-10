import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yammyapp/core/constants/constants.dart';

class FingerprintIcon extends StatelessWidget {
  final bool isScanned;
  const FingerprintIcon({
    super.key,
    required this.isScanned,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: SvgPicture.asset(
          AppAssets.fingerprint,
          key: ValueKey(isScanned),
          width: 200,
          height: 200,
          colorFilter: ColorFilter.mode(
            isScanned ? AppColors.primary : AppColors.primary.withOpacity(0.2),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
