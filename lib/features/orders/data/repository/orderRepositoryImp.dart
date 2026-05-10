import 'package:yammyapp/features/orders/data/datasources/orderDatasource.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/repository/orderRepository.dart';

class Orderrepositoryimp implements Orderrepository {
  final Orderdatasource orderdatasource;
  Orderrepositoryimp({required this.orderdatasource});
  Future<List<OrderEntity>> getOrders() async {
    final models = await orderdatasource.getOrders();
    return models.map((e)=>OrderEntity(
      addressId: e.addressId,
       restaurantId: e.restaurantId,
        paymentMethod: e.paymentMethod,
        couponCode: e.couponCode,
        notes: e.notes,
        )).toList() ;
  }
}
