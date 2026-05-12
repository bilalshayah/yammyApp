import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/navigation_bar.dart';
import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';
import 'package:yammyapp/features/orders/presentation/widgets/cancelOrder/body.dart';
import 'package:yammyapp/features/orders/presentation/widgets/cancelOrder/header.dart';

class CancelOrderScreen extends StatefulWidget {
  final String orderId;
  const CancelOrderScreen({super.key, required this.orderId});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  int? _selectedReason;
  final _othersController = TextEditingController();

  final List<String> _reasons = [
    'Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet',
    'Lorem ipsum dolor sit amet',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderCanceledSuccessfully) {
          Navigator.pop(context);
          context.read<OrderBloc>().add(GetOrderRequested());
        }
        if (state is OrderCanceledFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        bottomNavigationBar: NavBar(currentIndex: 3),
        body: Column(
          children: [
            Header(),
            Body(
              reasons: _reasons,
              selectedReason: _selectedReason,
              othersController: _othersController,
              onReasonSelected: (index) =>
                  setState(() => _selectedReason = index),
              onSubmit: _selectedReason == null
                  ? null
                  : () {
                      context.read<OrderBloc>().add(
                        CancelOrder(id: widget.orderId),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}