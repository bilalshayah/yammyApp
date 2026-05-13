import 'package:flutter/material.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/actionButton.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/dateAndItems.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/nameAndPrice.dart';

class OrderDetails extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;

  const OrderDetails({
    super.key,
    required this.order,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NameAndPrice(order: order),
        const SizedBox(height: 4),
        DateAndItems(order: order),
        const SizedBox(height: 8),
        ActionButtons(
          onPrimaryAction: onPrimaryAction,
          onSecondaryAction: onSecondaryAction,
          order: order,
        ),
      ],
    );
  }
}
