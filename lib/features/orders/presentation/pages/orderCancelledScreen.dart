import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/navigation_bar.dart';
import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';

class OrderCancelledScreen extends StatefulWidget {
  const OrderCancelledScreen({super.key});

  @override
  State<OrderCancelledScreen> createState() => _OrderCancelledScreenState();
}

class _OrderCancelledScreenState extends State<OrderCancelledScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      bottomNavigationBar: NavBar(currentIndex: 3),
      body: Column(
        children: [
          // back button
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  context.read<OrderBloc>().add(GetOrderRequested());
                },
                child: Icon(
                  Icons.chevron_left,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
            ),
          ),

          const Spacer(),

          // animated circle
          ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 3),
              ),
              child: Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // title
          Text(
            '¡Order Cancelled!',
            style: AppTextStyles.h1(color: AppColors.textPrimary),
          ),

          const SizedBox(height: 12),

          // subtitle
          Text(
            'Your order has been successfully\ncancelled',
            textAlign: TextAlign.center,
            style: AppTextStyles.description(),
          ),

          const Spacer(),

          // bottom text
          Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
            child: Text(
              'If you have any question reach directly to our customer support',
              textAlign: TextAlign.center,
              style: AppTextStyles.h3(),
            ),
          ),
        ],
      ),
    );
  }
}
