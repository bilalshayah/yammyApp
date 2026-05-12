import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';
import 'package:yammyapp/features/orders/presentation/widgets/orderTab_bar.dart';

class OrderBody extends StatefulWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  OrderBody({super.key, required this.selectedTab, required this.onTabChanged});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  List images = [
    "assets/images/pizza.png",
    "assets/images/pizza.png",
    "assets/images/pizza.png",
  ];
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrderRequested());
  }

  @override
Widget build(BuildContext context) {
  return Expanded(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          OrderTabBar(
            selectedTab: widget.selectedTab,
            onTabChanged: widget.onTabChanged,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                if (state is OrderLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is OrderSuccess) {
                  return ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              images[index % images.length],
                              fit: BoxFit.cover,
                              width: 70,
                              height: 108,
                            ),
                          ),
                          Column(
                            children: [
                              Text(state.orders[index].restaurantId),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
                if (state is OrderFailed) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}
