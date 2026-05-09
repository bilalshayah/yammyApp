import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CustomRecommendItem extends StatelessWidget {
  final String? imageUrl;
  final double? price;
  final String? rating;

  const CustomRecommendItem({
    super.key,
    this.imageUrl,
    this.price,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.38,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.05),
            child: (imageUrl != null && imageUrl!.startsWith('assets/'))
                ? Image.asset(
              imageUrl!,
              height: size.height * 0.22,
              width: size.width * 0.38,
              fit: BoxFit.cover,
            )
                : Container(
              height: size.height * 0.22,
              width: size.width * 0.38,
              color: Colors.grey[200],
              child: Icon(Icons.fastfood, color: Colors.grey, size: size.width * 0.08),
            ),
          ),

          Positioned(
            top: size.height * 0.012,
            left: size.width * 0.025,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.003,
                horizontal: size.width * 0.015,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(size.width * 0.02),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: size.width * 0.035),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    rating ?? "4.5",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: size.height * 0.035,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.005,
                horizontal: size.width * 0.025,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(size.width * 0.025),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Text(
                '\$${price?.toStringAsFixed(2) ?? "0.00"}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.028,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}