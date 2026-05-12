import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';

class DateAndItems extends StatelessWidget {
  final OrderEntity order;
  const DateAndItems({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          order.createdAt ?? '',
          style: AppTextStyles.h3(),
        ),
        Text(
          '${order.orderItems?.length ?? 0} items',
          style: AppTextStyles.h3(),
        ),
      ],
    );
  }
}