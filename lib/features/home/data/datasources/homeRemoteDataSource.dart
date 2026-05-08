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
    final response = await dio.get('$baseUrl/categories');
    return (response.data['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MenuItemModel>> getBestSellers() async {
    final response = await dio.get('$baseUrl/menu-items/best-sellers');
    return (response.data as List)
        .map((e) => MenuItemModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MenuItemModel>> getAllMenuItems() async {
    final response = await dio.get('$baseUrl/menu-items/?limit=10&page=1');
    return (response.data['data'] as List)
        .map((e) => MenuItemModel.fromJson(e))
        .toList();
  }
}