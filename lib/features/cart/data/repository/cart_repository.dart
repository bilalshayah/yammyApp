import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/app_endpoints.dart';
import '../models/cart_model.dart';

class CartRepository {
  final Dio dio = Dio();

  Future<CartModel> fetchCartData() async {
    try {
       final response = await dio.get(
           AppEndpoints.cart
       );
       return CartModel.fromJson(response.data);

    } on DioException catch (e) {

      throw Exception("خطأ في الاتصال بالسيرفر: ${e.message}");

    } catch (e) {
      throw Exception("حدث خطأ غير متوقع: $e");
    }
  }

  // Future<void> updateItemQuantity(String itemId, int newQuantity) async {
  //   try {
  //     await dio.put(
  //         "$_baseUrl/items/$itemId", data: {"quantity": newQuantity});
  //   } catch (e) {
  //     throw Exception("فشل تحديث الكمية");
  //   }
  // }
}