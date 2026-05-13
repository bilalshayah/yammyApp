import 'package:flutter/material.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/orderDetails.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/orderImage.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final int index;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;

  const OrderCard({
    super.key,
    required this.order,
    required this.index,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderImage(index: index),
          const SizedBox(width: 12),
          Expanded(
            child: OrderDetails(
              order: order,
              onPrimaryAction: onPrimaryAction,
              onSecondaryAction: onSecondaryAction,
            ),
          ),
        ],
      ),
    );
  }
}
