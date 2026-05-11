import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/navigation_bar.dart';
import 'package:yammyapp/features/orders/presentation/widgets/order_body.dart';
import 'package:yammyapp/features/orders/presentation/widgets/order_header.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        bottomNavigationBar: NavBar(currentIndex: 3),
        body: Column(
          children: [
            OrderHeader(),
            OrderBody(
              selectedTab: _selectedTab,
              onTabChanged: (index) => setState(() => _selectedTab = index),
            ),
          ],
        ),
      ),
    );
  }
}
