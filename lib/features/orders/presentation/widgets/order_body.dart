import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';
import 'package:yammyapp/features/orders/presentation/widgets/orderTab_bar.dart';
import 'package:yammyapp/features/orders/presentation/widgets/orderTab_content.dart';

class OrderBody extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  OrderBody({super.key, required this.selectedTab, required this.onTabChanged});
  List images = [
    "assets/images/pizza.png",
    "assets/images/pizza.png",
    "assets/images/pizza.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return CircularProgressIndicator();
          }
          if (state is OrderSuccess) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Divider(color: AppColors.divider),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            width: 70,
                            height: 108,
                          ),
                        ),
                        Column(children: [
                          Text(state.orders[index].addressId),
                          Text("data"),
                        ],)
                      ],
                    ),

                    Divider(color: AppColors.divider),
                  ],
                );
              },
            );
          }
          return Container(
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
                  selectedTab: selectedTab,
                  onTabChanged: onTabChanged,
                ),
                const SizedBox(height: 24),
                Expanded(child: OrdertabContent(selectedTab: selectedTab)),
              ],
            ),
          );
        },
      ),
    );
  }
}
