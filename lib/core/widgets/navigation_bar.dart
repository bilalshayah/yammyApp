import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yammyapp/core/constants/constants.dart';

class NavBar extends StatelessWidget {
  final int? currentIndex;
  const NavBar({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.075,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size.width * 0.08),
          topRight: Radius.circular(size.width * 0.08),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(icon: AppAssets.home, index: 0, currentIndex: currentIndex),
          _NavItem(
            icon: AppAssets.dishes,
            index: 1,
            currentIndex: currentIndex,
          ),
          _NavItem(
            icon: AppAssets.preferred,
            index: 2,
            currentIndex: currentIndex,
          ),
          _NavItem(icon: AppAssets.saved, index: 3, currentIndex: currentIndex),
          _NavItem(
            icon: AppAssets.support,
            index: 4,
            currentIndex: currentIndex,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final int index;
  final int? currentIndex;

  const _NavItem({
    required this.icon,
    required this.index,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => _navigate(context, index),
      child: SvgPicture.asset(
        icon,
        width: size.width * 0.075,
        height: size.height * 0.03,
        colorFilter: ColorFilter.mode(
          isActive
              ? AppColors.textWhite
              : AppColors.textWhite.withOpacity(0.54),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    final pages = [
      // HomePage(),
      // PreparePage(),
      // PrefarePage(),
      // SavedPage(),
      // SupportPage(),
    ];

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => pages[index]));
  }
}
