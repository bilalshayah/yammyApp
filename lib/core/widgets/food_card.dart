import 'package:flutter/material.dart';

import '../constants/appTextStyle.dart';
import '../constants/app_colors.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final double rating;

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text(name, style: AppTextStyles.title()),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: AppColors.primary)),
              const SizedBox(width: 8),
              // rating badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Text(rating.toString(), style: AppTextStyles.rate()),
                    const SizedBox(width: 2),
                    const Icon(Icons.star, color: Colors.amber, size: 13),
                  ],
                ),
              ),
              const Spacer(),
              Text('\$${price.toStringAsFixed(2)}', style: AppTextStyles.price()),
            ],
          ),

          const SizedBox(height: 4),

          Text(description, style: AppTextStyles.subtitle()),

          const Divider(height: 24, color: AppColors.divider),
        ],
      ),
    );
  }
}
