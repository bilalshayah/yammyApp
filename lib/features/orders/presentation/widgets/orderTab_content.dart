import 'package:flutter/material.dart';
import 'package:yammyapp/features/orders/presentation/widgets/empty_state.dart';

class OrdertabContent extends StatelessWidget {
  final int selectedTab;
  const OrdertabContent({super.key, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    switch (selectedTab) {
      case 0:
        return const EmptyState(); // active — empty for now
      case 1:
        return const EmptyState(); // completed
      case 2:
        return const EmptyState(); // cancelled
      default:
        return const EmptyState();
    }
  }
}