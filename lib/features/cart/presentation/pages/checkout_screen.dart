import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_appbar.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';
import 'package:yammyapp/features/cart/presentation/widgets/cart_divider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/auth_button.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import '../widgets/checkout_item.dart';
import '../widgets/summary_row.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.activeCategory,
      extendBody: true,
      bottomNavigationBar: const NavBar(),
      appBar: AppAppBar(
        text: 'Confirm Order',
        function: () => Navigator.pop(context),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: context.screenHeight * 0.02),
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.06,
              vertical: context.screenHeight * 0.03,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.screenWidth * 0.12),
                topRight: Radius.circular(context.screenWidth * 0.12),
              ),
            ),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.primary));
                }
                if (state is CartFetched) {
                  final cart = state.cart;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text("Shipping Address", style: AppTextStyles.h2()),
                          const SizedBox(width: 8),
                          SvgIcon(path: AppAssets.edit),
                        ]),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.yellow2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                              '778 Locust View Drive Oaklanda, CA',
                              style: AppTextStyles.price(color: Colors.black)
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(children: [
                          Text("Order Summary", style: AppTextStyles.h2()),
                          const SizedBox(width: 8),
                          SvgIcon(path: AppAssets.edit),
                        ]),
                        const SizedBox(height: 8),
                        const CartDivider(),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cart.cartItems[index];
                            return Column(
                              children: [
                                CheckoutItem(
                                  itemId: item.id,
                                  onDelete: () => context.read<CartBloc>().add(ItemDelete(itemId: item.id)),
                                  imageUrl: item.menuItem.image,
                                  name: item.menuItem.name,
                                  time: item.menuItem.createdAt.toString(),
                                  price: item.menuItem.price.toDouble(),
                                  quantity: item.quantity,
                                ),
                                const CartDivider(),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        SummaryRow(
                          label: 'Subtotal',
                          value: '\$${cart.subtotal.toStringAsFixed(2)}',
                        ),
                        const SummaryRow(label: 'Tax and Fees', value: '\$5.00'),
                        const SummaryRow(label: 'Delivery', value: '\$3.00'),
                        SummaryRow(
                          label: 'Total',
                          value: '\$${(cart.subtotal + 8).toStringAsFixed(2)}',
                          isTotal: true,
                        ),
                        const CartDivider(),
                        const SizedBox(height: 25),
                        Center(
                          child: AuthButton(
                            function: () {},
                            color: AppColors.orange2,
                            width: 175,
                            textColor: AppColors.primary,
                            text: 'Place Order',
                          ),
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  );
                }
                if (state is CartError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text("Cart is Empty"));
              },
            ),
          ),
        ],
      ),
    );
  }
}