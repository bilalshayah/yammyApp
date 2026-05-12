import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/constants/content_background.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';
import 'package:yammyapp/core/widgets/auth_button.dart';
import 'package:yammyapp/features/cart/presentation/widgets/cart_summary.dart';
import '../widgets/cart_item.dart';

class EmptyCartScreen extends StatelessWidget {

  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContentBackground(),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 60,
            child: Container(
              decoration: BoxDecoration(
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
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: AppColors.textWhite,
                            radius: 30,
                            child: SvgIcon(path: AppAssets.cart)),
                        SizedBox(width: 15),
                        Text(
                          "Cart",
                          style: AppTextStyles.h2(color: AppColors.textWhite),
                        ),
                        const SizedBox(height: 30),
                        Text("Your cart is empty", style: AppTextStyles.price(color: AppColors.textWhite)),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const Icon(Icons.add_circle_outline, color: Colors.white, size: 80),
                  const SizedBox(height: 30),
                  Text("Want To Add \nSomething?", style: AppTextStyles.h2(color: AppColors.textWhite)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
