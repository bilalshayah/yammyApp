import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CustomBestSellerCard extends StatelessWidget {
  final String? imageUrl;
  final double? price;

  const CustomBestSellerCard({
    super.key,
    this.imageUrl,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.05),
            child: (imageUrl != null && imageUrl!.startsWith('assets/'))
                ? Image.asset(
              imageUrl!,
              height: size.height * 0.17,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            )
                : Container(
              height: size.height * 0.17,
              width: size.width * 0.3,
              color: Colors.grey[200],
              child: Icon(Icons.fastfood, color: Colors.grey, size: size.width * 0.08),
            ),
          ),
          Positioned(
            bottom: size.height * 0.02,
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