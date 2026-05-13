import 'package:yammyapp/features/orders/data/datasources/orderDatasource.dart';
import 'package:yammyapp/features/orders/data/models/createOrderModel.dart';
import 'package:yammyapp/features/orders/data/models/orderModel.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/repository/orderRepository.dart';

class Orderrepositoryimp implements Orderrepository {
  final Orderdatasource orderdatasource;

  Orderrepositoryimp({required this.orderdatasource});
  @override
  Future<List<OrderEntity>> getOrders() async {
    final models = await orderdatasource.getOrders();
    return models.map((e) => _mapToEntity(e)).toList();
  }

  @override
  Future<OrderEntity> getOrderDetails(String id) async {
    final model = await orderdatasource.getOrderDetails(id);
    return _mapToEntity(model);
  }

  @override
  Future<void> cancelOrder(String id) async {
    await orderdatasource.cancelOrder(id);
  }

  @override
  Future<void> createOrder(Createordermodel order) async {
    await orderdatasource.createOrder(order);
  }
}

// helper method to avoid repeating mapping code
OrderEntity _mapToEntity(Ordermodel e) {
  return OrderEntity(
    id: e.id,
    orderNumber: e.orderNumber,
    status: e.status,
    paymentStatus: e.paymentStatus,
    paymentMethod: e.paymentMethod,
    subtotal: e.subtotal,
    deliveryFee: e.deliveryFee,
    addressId: e.addressId,
    restaurantId: e.restaurantId,
    tax: e.tax,
    estimatedTime: e.estimatedTime,
    discount: e.discount,

    total: e.total,
    notes: e.notes,
    couponCode: e.couponCode,
    createdAt: e.createdAt,
    orderItems: e.orderItems
        ?.map(
          (item) => OrderItemEntity(
            id: item.id,
            name: item.name,
            price: item.price,
            quantity: item.quantity,
            notes: item.notes,
            subtotal: item.subtotal,
          ),
        )
        .toList(),
  );
}
