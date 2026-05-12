import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/constants/content_background.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

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
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.white54, thickness: 1, indent: 30, endIndent: 30),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                       ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
