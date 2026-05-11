import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';

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
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.08),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: size.height * 0.01),

          // name + rating + price
          Row(
            children: [
              Text(name, style: AppTextStyles.title()),
              SizedBox(width: size.width * 0.02),
              const Text('•', style: TextStyle(color: AppColors.primary)),
              SizedBox(width: size.width * 0.02),
              // rating badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                  vertical: size.height * 0.0025,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(size.width * 0.08),
                ),
                child: Row(
                  children: [
                    Text(rating.toString(), style: AppTextStyles.rate()),
                    SizedBox(width: size.width * 0.005),
                    Icon(Icons.star, color: Colors.amber, size: size.width * 0.035),
                  ],
                ),
              ),
              const Spacer(),
              Text('\$${price.toStringAsFixed(2)}', style: AppTextStyles.price()),
            ],
          ),

          SizedBox(height: size.height * 0.005),

          Text(description, style: AppTextStyles.subtitle()),

          Divider(height: size.height * 0.03, color: AppColors.divider),
        ],
      ),
    );
  }
}