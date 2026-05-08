
import '../../domain/repository/homeRepository.dart';
import '../datasources/homeRemoteDataSource.dart';
import '../models/category_model.dart';
import '../models/menu_item_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryModel>> getHomeCategories() async {
    try {
      return await remoteDataSource.getCategories();
    } catch (e) {
      throw Exception("Failed to load categories: $e");
    }
  }

  @override
  Future<List<MenuItemModel>> getHomeBestSellers() async {
    try {
      return await remoteDataSource.getBestSellers();
    } catch (e) {
      throw Exception("Failed to load best sellers: $e");
    }
  }

  @override
  Future<List<MenuItemModel>> getHomeAllMenuItems() async {
    try {
      return await remoteDataSource.getAllMenuItems();
    } catch (e) {
      throw Exception("Failed to load menu items: $e");
    }
  }
}