import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';

class OrderTabBar extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const OrderTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  final List<String> tabs = const ['Active', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        tabs.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () => onTabChanged(index),
            child: Center(
              child: AnimatedContainer(
                height: 35,
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: selectedTab == index
                      ? AppColors.primary
                      : AppColors.orange,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    tabs[index],
                    style: selectedTab == index
                        ? AppTextStyles.activetab(color: AppColors.textWhite)
                        : AppTextStyles.tab(color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
