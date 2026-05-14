import 'package:flutter/material.dart';
import '../../../../core/constants/appTextStyle.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: AppTextStyles.buttonText().copyWith(
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400
        ),
      ),
      trailing: Text(
        value,
        style: AppTextStyles.buttonText().copyWith(
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400
        ),
      ),
    );
  }
}