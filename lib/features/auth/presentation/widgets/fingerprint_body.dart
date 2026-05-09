import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/extension.dart/context_extention.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import 'package:yammyapp/features/auth/presentation/widgets/fingerprint_description.dart';
import 'package:yammyapp/features/auth/presentation/widgets/fingerprint_icon.dart';

class FingerprintBody extends StatelessWidget {
  final bool isScanned;
  const FingerprintBody({
    super.key,
    required this.isScanned,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            FingerprintDescription(),
            const Spacer(),
            FingerprintIcon(isScanned: isScanned,),
            const Spacer(),
            SizedBox(
              width: context.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Skip',
                      color: AppColors.orange,
                      function: () {
                        // Handle skip action
                      },
                      textColor: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      function: () {
                        if(isScanned) {
                          // Handle continue action
                        } else {
                          // Show a message to scan fingerprint first
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
            ),
          ],
        ),
      ),
    );
  }
}
