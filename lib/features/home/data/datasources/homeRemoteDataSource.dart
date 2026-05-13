import 'package:dio/dio.dart';

import '../models/category_model.dart';
import '../models/menu_item_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<MenuItemModel>> getBestSellers();
  Future<List<MenuItemModel>> getAllMenuItems();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;
  final String baseUrl = "https://yammybackend-production.up.railway.app/api/v1";

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get('$baseUrl/categories/');

      // التعديل هنا: السيرفر يعيد Map مباشرة
      if (response.data is Map<String, dynamic>) {
        final category = CategoryModel.fromJson(response.data);
        return [category]; // نلفه في قائمة ليقبله الـ Repository والـ Bloc
      } else if (response.data['data'] != null) {
        // احتياطاً إذا كان الرد مغلف بكلمة data مستقبلاً
        final List data = response.data['data'];
        return data.map((e) => CategoryModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("❌ API Error in getCategories: $e");
      rethrow;
    }
  }

  @override
  Future<List<MenuItemModel>> getBestSellers() async {
    try {
      final response = await dio.get('$baseUrl/menu-items/best-sellers');

      // السيرفر يعيد كائناً واحداً للمنتج
      if (response.data is Map<String, dynamic>) {
        final item = MenuItemModel.fromJson(response.data);
        return [item];
      }
      return [];
    } catch (e) {
      print("❌ API Error in getBestSellers: $e");
      rethrow;
    }
  }

  @override
  Future<List<MenuItemModel>> getAllMenuItems() async {
    try {
      final response = await dio.get('$baseUrl/menu-items/?limit=10&page=1');
      return (response.data['data'] as List)
          .map((e) => MenuItemModel.fromJson(e))
          .toList();
    }
    catch (e) {
    print("❌ API Error in getCategories: $e");
    rethrow;
    }
  }
}
