import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/router/app_router.dart';
import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';
import 'package:yammyapp/features/orders/presentation/pages/cancelOrdreScreen.dart';
import 'package:yammyapp/features/orders/presentation/pages/orderCard.dart';
import 'package:yammyapp/features/orders/presentation/pages/leaveReviewScreen.dart';
import 'package:yammyapp/features/orders/presentation/widgets/orderPage/orderTab_bar.dart';
import 'package:yammyapp/features/orders/presentation/widgets/orderPage/orderTab_content.dart';

class OrderBody extends StatefulWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const OrderBody({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
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
                    final orderFilter = state.orders.where((order) {
                      switch (widget.selectedTab) {
                        case 0: // Active
                          return order.status == 'PENDING' ||
                              order.status == 'CONFIRMED' ||
                              order.status == 'PREPARING' ||
                              order.status == 'READY_FOR_PICKUP' ||
                              order.status == 'OUT_FOR_DELIVERY';
                        case 1: // Completed
                          return order.status == 'DELIVERED';
                        case 2: // Cancelled
                          return order.status == 'CANCELLED' ||
                              order.status == 'REFUNDED';
                      }

                      return true;
                    }).toList();
                    if (orderFilter.isEmpty) {
                      return OrdertabContent(selectedTab: widget.selectedTab);
                    }

                    return ListView.builder(
                      itemCount: orderFilter.length,
                      itemBuilder: (context, index) {
                        final order = orderFilter[index];
                        final isDelivered = order.status == 'DELIVERED';
                        final isCancelled =
                            order.status == 'CANCELLED' ||
                            order.status == 'REFUNDED';

                        return OrderCard(
                          order: order,
                          index: index,
                          onPrimaryAction: () {

                            /////
                            // if (isDelivered) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Leavereviewscreen()
                            //         image: 'assets/images/pizza.png',
                            //         name: order.orderItems?.isNotEmpty == true
                            //             ? order.orderItems!.first.name
                            //             : 'Order',
                                  
                            //     ),
                            //   );
                            //   return;
                            // }

                            if (isCancelled) {
                               Navigator.pushNamed(context,AppRouter.cancelOrder,arguments: order.id) ;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CancelOrderScreen(orderId: order.id),
                              ),
                            );
                          },
                          onSecondaryAction: () {
                            if (isDelivered || isCancelled) {
                              // Navigator.pushNamed(context, AppRouter.cart);
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tracking is not available yet.'),
                              ),
                            );
                          },
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
