import 'package:yammyapp/core/api_helper/dio_client.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/data/models/createOrderModel.dart';
import 'package:yammyapp/features/orders/data/models/orderModel.dart';

class Orderdatasource {
  DioClient dioClient;
  Orderdatasource(this.dioClient);
  // getting all orders
  Future<List<Ordermodel>> getOrders() async {
    final response = await dioClient.dio.get(AppEndpoints.orders);
    return (response.data['data'] as List)
        .map((e) => Ordermodel.fromJson(e))
        .toList();
  }

  // get one order by id
  Future<Ordermodel> getOrderDetails(String id) async {
    final response = await dioClient.dio.get(AppEndpoints.order(id));
    return Ordermodel.fromJson(response.data['data']);
  }

  // cancel order
  Future<void> cancelOrder(String id) async {
    await dioClient.dio.patch(AppEndpoints.cancelOrder(id));
  }

  // create order
  Future<void> createOrder(Createordermodel order) async {
    await dioClient.dio.post(
      AppEndpoints.orders,
      data:  order.toJson()
      
    );
  }
}
