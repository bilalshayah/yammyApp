import '../../data/models/category_model.dart';
import '../../data/models/menu_item_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> getHomeCategories();
  Future<List<MenuItemModel>> getHomeBestSellers();
  Future<List<MenuItemModel>> getHomeAllMenuItems();
}