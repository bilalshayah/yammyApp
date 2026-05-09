import '../../data/models/category_model.dart';
import '../../data/models/menu_item_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<MenuItemModel> bestSellers;
  final List<MenuItemModel> allItems;

  HomeLoaded({
    required this.categories,
    required this.bestSellers,
    required this.allItems,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}