import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_colors.dart';

class TestHomePage extends StatelessWidget {
  const TestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          })
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.textWhite,
                      child: SvgIcon(path: AppAssets.cart
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                        "Cart",
                        style: AppTextStyles.h2(color: AppColors.textWhite)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.yellow2, indent: 30, endIndent: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "You have 2 items in the cart",
                          style: AppTextStyles.activetab(),
                        ),
                        const SizedBox(height: 20),
                        cartItem("Strawberry Shake", "\$20.00", "https://via.placeholder.com/60", "2"),
                        const Divider(color: AppColors.orange2),
                        cartItem("Broccoli Lasagna", "\$12.00", "https://via.placeholder.com/60", "1"),
                        const Spacer(),
                        priceRow("Subtotal", "\$32.00"),
                        priceRow("Tax and Fees", "\$5.00"),
                        priceRow("Delivery", "\$3.00"),
                        const Divider(color: AppColors.orange2),
                        priceRow("Total", "\$40.00", isTotal: true),
                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.activeCategory,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Checkout",
                              style: TextStyle(
                                color: Color(0xFFE85D22),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const Center(child: Text("Content Area")),
    );
  }

  // الدوال المساعدة (cartItem & priceRow) تبقى كما هي في كودك الأصلي
  Widget cartItem(String title, String price, String img, String qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(img, width: 60, height: 60, fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(color: Colors.grey, width: 60, height: 60)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(price, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.remove_circle, color: Colors.white, size: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(qty, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const Icon(Icons.add_circle, color: Colors.white, size: 20),
            ],
          )
        ],
      ),
    );
  }

  Widget priceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white, fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}