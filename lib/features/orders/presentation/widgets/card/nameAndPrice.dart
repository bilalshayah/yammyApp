import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';

class NameAndPrice extends StatelessWidget {
  final OrderEntity order;
  const NameAndPrice({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          order.orderItems?[0].name ?? 'Order',
          style: AppTextStyles.title(),
        ),
        Text(
          '\$${order.total ?? '0.00'}',
          style: AppTextStyles.price(),
        ),
      ],
    );
  }
}