import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

Widget buildPromoBanner(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Container(
    width: double.infinity,
    height: size.height * 0.15,
    decoration: BoxDecoration(
      color: AppColors.textOrange,
      borderRadius: BorderRadius.circular(size.width * 0.05),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Experience our\ndelicious new dish",
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.035,
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Text(
                "30% OFF",
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: size.width * 0.05,

                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(size.width * 0.05),
            bottomRight: Radius.circular(size.width * 0.05),
          ),
          child: Image.asset(
            'assets/images/pizza.jpg',
            width: size.width * 0.35,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}