import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/data/models/orderModel.dart';

class Orderdatasource {
  Dio dio;
  Orderdatasource(this.dio);
  // getting all orders
  Future<List<Ordermodel>> getOrders() async {
    final response = await dio.get(AppEndpoints.orders);
    return (response.data as List).map((e) => Ordermodel.fromJson(e)).toList();
  }
}
