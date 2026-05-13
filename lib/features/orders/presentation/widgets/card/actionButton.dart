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

    return card(isDelivered, isCancelled);
  }

  Widget card(bool lisDelivered, bool isCancelled) {
    if (lisDelivered) {
      return Row(
        children: [
          CardButton(
            text: 'Leave a review',
            color: AppColors.primary,
            textColor: AppColors.textWhite,
            onTap: onPrimaryAction,
          ),
          const SizedBox(width: 8),
          CardButton(
            text: 'Order Again',
            color: AppColors.orange,
            textColor: AppColors.primary,
            onTap: onSecondaryAction,
          ),
        ],
      );
    } else if (isCancelled) {
      return
      CardButton(
        text: '🗷 Order cancelled',
        textColor: AppColors.primary,
        color: Colors.transparent,
        onTap: () {},
      );
    }else{
      return
      Row(
        children: [
          CardButton(
            text: 'Cancel Order',
            color: AppColors.primary,
            textColor: AppColors.textWhite,
            onTap: onPrimaryAction,
          ),
          const SizedBox(width: 8),
          CardButton(
            text: 'Track Driver',
            color: AppColors.orange,
            textColor: AppColors.primary,
            onTap: onSecondaryAction,
          ),
        ],
      );

    }
  }
}
