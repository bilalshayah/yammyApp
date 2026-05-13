import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import 'package:yammyapp/features/orders/presentation/widgets/otherField.dart';
import 'package:yammyapp/features/orders/presentation/widgets/cancelOrder/reasonItem.dart';

class Body extends StatelessWidget {
  final List<String> reasons;
  final int? selectedReason;
  final TextEditingController othersController;
  final Function(int) onReasonSelected;
  final VoidCallback? onSubmit;

  const Body({super.key, 
    required this.reasons,
    required this.selectedReason,
    required this.othersController,
    required this.onReasonSelected,
    required this.onSubmit,
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
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor.',
              style: AppTextStyles.description(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                    reasons.length,
                    (index) => ReasonItem(
                      text: reasons[index],
                      isSelected: selectedReason == index,
                      onTap: () => onReasonSelected(index),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Others', style: AppTextStyles.h3()),
                  const SizedBox(height: 8),
                  OthersField(text:'Others reason...' ,controller: othersController),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Submit',
                    function: onSubmit,
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