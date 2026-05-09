import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yammyapp/core/constants/constants.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 49,
          height: 62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isActive ? AppColors.activeCategory : AppColors.yellow2,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ),
        ),
        Text(label, style: AppTextStyles.label()),
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int activeIndex = 0;

  final List<Map<String, String>> categories = [
    {'icon': AppAssets.snacks, 'label': 'Snacks'},
    {'icon': AppAssets.meals, 'label': 'Meal'},
    {'icon': AppAssets.vegan, 'label': 'Vegan'},
    {'icon': AppAssets.desserts, 'label': 'Dessert'},
    {'icon': AppAssets.drinks, 'label': 'Drinks'},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        categories.length,
        (index) => GestureDetector(
          onTap: () => setState(() => activeIndex = index),
          child: CategoryItem(
            icon: categories[index]['icon']!,
            label: categories[index]['label']!,
            isActive: activeIndex == index,
          ),
        ),
      ),
    );
  }
}
