import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/category_item.dart';
import '../../../../core/widgets/food_card.dart';
import '../../../../core/widgets/search_bar.dart';
import '../../domain/repository/homeRepository.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../../../../core/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        homeRepository: context.read<HomeRepository>(),
      )..add(LoadHomeDataEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        bottomNavigationBar: const NavBar(currentIndex: 0),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good Morning", style: AppTextStyles.title),
                            const SizedBox(height: 15),
                            CustomSearchBar(controller: TextEditingController()),
                          ],
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Categories(),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Best Seller", style: AppTextStyles.title),
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.bestSellers.length,
                        itemBuilder: (context, index) {
                          final item = state.bestSellers[index];
                          return FoodCard(
                            imageUrl: item.image,
                            name: item.name,
                            description: item.description,
                            price: item.effectivePrice,
                            rating: item.rating,
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}