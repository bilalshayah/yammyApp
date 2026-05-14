import 'package:flutter/material.dart';
import 'package:yammyapp/core/router/app_router.dart';
import '../../../../core/widgets/customNavigationDrawer.dart';
import '../widgets/customBestSellerCard.dart';
import '../../../../core/widgets/category_item.dart';
import '../../../../core/widgets/food_card.dart';
import '../../../../core/widgets/search_bar.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/buildHeaderIcon.dart';
import '../widgets/buildPromoBanner.dart';
import '../widgets/buildSectionTitle.dart';
import '../widgets/customRecommendItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;

  static const List<String> localImages = [
    'assets/images/burger.jpg',
    'assets/images/chicken sandwish.webp',
    'assets/images/food1.jpg',
    'assets/images/food2.jpg',
    'assets/images/kobah.jpg',
    'assets/images/pizza.jpg',
    'assets/images/shawrma.jpg',
    'assets/images/soshi.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      endDrawer: const CustomNavigationDrawer(),
      backgroundColor: AppColors.activeCategory,
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * 0.05,
                  size.height * 0.04,
                  size.width * 0.05,
                  size.height * 0.015,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomSearchBar(controller: _searchController),
                        ),
                        SizedBox(width: size.width * 0.02),
                        buildHeaderIcon(Icons.notifications_none_outlined, () => Navigator.pushNamed(context, AppRouter.notifications)),
                        SizedBox(width: size.width * 0.015),
                        buildHeaderIcon(Icons.shopping_bag_outlined, () => Navigator.pushNamed(context, AppRouter.cart)),
                        SizedBox(width: size.width * 0.015),
                        Builder(
                          builder: (context) => buildHeaderIcon(Icons.person_outline, () {
                            Scaffold.of(context).openEndDrawer();
                          }),
                          ),

                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Good Morning",
                      style: AppTextStyles.title(color: AppColors.textWhite),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      "Rise and shine! It's breakfast time",
                      style: AppTextStyles.h3(color: AppColors.textOrange),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width * 0.1),
                    topRight: Radius.circular(size.width * 0.1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.025,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Categories(),
                      SizedBox(height: size.height * 0.025),
                      buildSectionTitle("Best Seller"),
                      SizedBox(height: size.height * 0.012),
                      SizedBox(
                        height: size.height * 0.18,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: localImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.28,
                              margin: EdgeInsets.only(right: size.width * 0.04),
                              child: CustomBestSellerCard(
                                imageUrl: localImages[index],
                                price: 10.99 + index,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      buildPromoBanner(context),
                      SizedBox(height: size.height * 0.03),
                      buildSectionTitle("Recommend"),
                      SizedBox(height: size.height * 0.012),
                      SizedBox(
                        height: size.height * 0.25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: size.width * 0.04),
                              child: CustomRecommendItem(
                                imageUrl: localImages[(index + 4) % localImages.length],
                                price: 12.50,
                                rating: "4.8",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
