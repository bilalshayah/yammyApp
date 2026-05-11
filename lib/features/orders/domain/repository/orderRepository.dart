import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';

abstract class Orderrepository {
  
  Future<List<OrderEntity>> getOrders();
  Future<OrderEntity> getOrderDetails(String id);
  Future<void> cancelOrder(String id);
}
