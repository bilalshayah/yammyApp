import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import 'package:yammyapp/features/auth/presentation/widgets/fingerprint_description.dart';
import 'package:yammyapp/features/auth/presentation/widgets/fingerprint_icon.dart';
import '../../../../core/extensions/context_extensions.dart';

class FingerprintBody extends StatelessWidget {
  final bool isScanned;
  const FingerprintBody({super.key, required this.isScanned});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight,
      margin: EdgeInsets.only(
          top: context.screenHeight * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.06,
        vertical: context.screenHeight * 0.03,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.screenWidth * 0.12),
          topRight: Radius.circular(context.screenWidth * 0.12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const FingerprintDescription(),
          FingerprintIcon(isScanned: isScanned),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Skip',
                  color: AppColors.orange,
                  textColor: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12 ),
              Expanded(
                child: CustomButton(
                  function: () {
                    if (isScanned) {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please scan your fingerprint first')),
                      );
                    }
                  },
                  text: 'Continue',
                  color: AppColors.primary,
                  textColor: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}