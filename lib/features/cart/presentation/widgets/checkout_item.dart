import 'package:flutter/material.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/svg_icon.dart';

class CheckoutItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;
  final String itemId;
  final double price;
  final int quantity;
  final VoidCallback onDelete;

  const CheckoutItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.price,
    required this.quantity,
    required this.onDelete,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 5),
          GestureDetector(
              onTap: onDelete,
              child: SvgIcon(path: AppAssets.delete,height: 22,width: 22)),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: AppTextStyles.skip(color: Colors.black)
                      ),
                    ],
                  ),
                  Text(
                    time,
                    style: AppTextStyles.label(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE4D6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Cancel Order',
                            style: AppTextStyles.tab(color: AppColors.primary),
                          ),
                        ),
                      ),
                ],
              ),
              ]),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: AppTextStyles.title(color: AppColors.primary)
                  ),
                  Text(
                    '$quantity items',
                    style: AppTextStyles.label(),
                  ),
                  SizedBox( height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_circle,
                        color: AppColors.primary,
                        size: 25,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '$quantity',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 2),
                      const Icon(
                        Icons.add_circle,
                        color: AppColors.primary,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
                ],
              ),
            ],
          ),
    );
  }
}