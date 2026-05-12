import 'package:flutter/material.dart';
import 'package:yammyapp/features/orders/presentation/widgets/orderPage/empty_state.dart';

class OrdertabContent extends StatelessWidget {
  final int selectedTab;
  const OrdertabContent({super.key, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case 0:
        return const EmptyState(selectedTab: 0,); // active — empty for now
      case 1:
        return const EmptyState(selectedTab: 1,); // completed
      case 2:
        return const EmptyState(selectedTab: 2,); // cancelled
      default:
        return const EmptyState(selectedTab: 0,);
    }
  }
}
