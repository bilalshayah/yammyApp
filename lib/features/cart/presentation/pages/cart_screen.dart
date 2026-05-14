import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/constants/content_background.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';
import 'package:yammyapp/core/widgets/auth_button.dart';
import 'package:yammyapp/features/cart/presentation/pages/empty_cart_screen.dart';
import 'package:yammyapp/features/cart/presentation/widgets/cart_summary.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/router/app_router.dart';
import '../bloc/cart_state.dart';
import '../widgets/cart_divider.dart';
import '../widgets/cart_item.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ContentBackground(),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 60,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(-5, 0),
                  )
                ],
              ),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator(color: Colors.white));
                  }

                  if (state is CartFetched) {
                    final cart = state.cart;
                    return Column(
                      children: [
                        const SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: AppColors.textWhite,
                                  radius: 23,
                                  child: SvgIcon(path: AppAssets.cart)),
                              const SizedBox(width: 15),
                              Text(
                                "Cart",
                                style: AppTextStyles.h2(color: AppColors.textWhite),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        CartDivider(),
                        SizedBox(height: context.screenHeight * 0.02),
                        Text(
                            "You have ${cart.cartItems.length} items in the cart",
                            style: AppTextStyles.price(color: AppColors.textWhite)
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              ...cart.cartItems.map((item) => Column(
                                children: [
                                  CartItem(
                                      item.menuItem.name,
                                      "\$${item.menuItem.price}",
                                      item.quantity,
                                      item.menuItem.image
                                  ),
                                  CartDivider(),
                                ],
                              )).toList(),
                              CartSummary("Subtotal", "\$${cart.subtotal.toStringAsFixed(2)}"),
                              const CartSummary("Tax and Fees", "\$5.00"),
                              const CartSummary("Delivery", "\$3.00"),
                              const Divider(color: Colors.white, thickness: 1, height: 40),
                              CartSummary("Total", "\$${(cart.subtotal + 8).toStringAsFixed(2)}"),
                              const SizedBox(height: 30),
                              AuthButton(
                                text: "Checkout",
                                color: AppColors.activeCategory,
                                function: () => Navigator.pushNamed(context, AppRouter.checkout),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  if (state is CartError) {
                    return Center(child: Text(state.message, style: const TextStyle(color: Colors.white)));
                  }
                  return EmptyCartScreen();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}