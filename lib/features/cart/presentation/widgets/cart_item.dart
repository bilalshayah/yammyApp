import 'package:flutter/material.dart';
import '../../../../core/constants/appTextStyle.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String price;
  final int qty;
  final String path;

  const CartItem(this.title, this.price, this.qty, this.path, {super.key});


  @override
  Widget build(BuildContext context) {
      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              path,
              width: 60, height: 60, fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.activetab()),
                Text(price, style: AppTextStyles.activetab()),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.remove_circle_outline, color: Colors.white, size: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(qty.toString(), style: AppTextStyles.subtitle())),
              const Icon(Icons.add_circle_outline, color: Colors.white, size: 20),
            ],
          )
        ],
      );
  }
}
