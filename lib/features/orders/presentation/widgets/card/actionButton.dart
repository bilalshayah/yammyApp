import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/cardButton.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;
  final OrderEntity order;

  const ActionButtons({
    super.key,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final isDelivered = order.status == 'DELIVERED';
    final isCancelled =
        order.status == 'CANCELLED' || order.status == 'REFUNDED';

    return Row(
      children: [
        CardButton(
          text: isDelivered
              ? 'Leave a review'
              : (isCancelled ? 'Cancelled' : 'Cancel Order'),
          color: AppColors.primary,
          textColor: AppColors.textWhite,
          onTap: onPrimaryAction,
        ),
        const SizedBox(width: 8),
        CardButton(
          text: isDelivered || isCancelled ? 'Order Again' : 'Track Driver',
          color: AppColors.orange,
          textColor: AppColors.primary,
          onTap: onSecondaryAction,
        ),
      ],
    );
  }
}
