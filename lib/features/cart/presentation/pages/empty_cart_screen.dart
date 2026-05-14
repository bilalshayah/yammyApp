import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';
import 'package:yammyapp/core/extensions/context_extensions.dart';
import 'package:yammyapp/core/router/app_router.dart';

import '../widgets/cart_divider.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
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
        child: Column(
          children: [
            SizedBox(height: context.screenHeight * 0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.textWhite,
                    radius: context.screenWidth * 0.07,
                    child: SvgIcon(
                      path: AppAssets.cart,
                      width: context.screenWidth * 0.08,
                      height: context.screenWidth * 0.08,
                    )
                  ),
                  SizedBox(width: context.screenWidth * 0.04),
                  Text(
                    "Cart",
                    style: AppTextStyles.h2(color: AppColors.textWhite),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.04),
            CartDivider(),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              "Your cart is empty",
              style: AppTextStyles.price(color: AppColors.textWhite),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              color: Colors.white,
              iconSize: context.screenWidth * 0.25,
              onPressed: () => Navigator.pushNamed(context, AppRouter.home),
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Text(
              "Want To Add \nSomething?",
              textAlign: TextAlign.center,
              style: AppTextStyles.h2(color: AppColors.textWhite),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}