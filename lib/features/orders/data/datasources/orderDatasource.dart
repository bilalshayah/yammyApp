import 'package:yammyapp/core/api_helper/dio_client.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/data/models/orderModel.dart';

class Orderdatasource {
  DioClient dioClient;
  Orderdatasource(this.dioClient);
  // getting all orders
  Future<List<Ordermodel>> getOrders() async {
    final response = await dioClient.dio.get(AppEndpoints.orders);
    return (response.data['data'] as List).map((e) => Ordermodel.fromJson(e)).toList();
  }
}
