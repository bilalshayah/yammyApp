import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/repository/orderRepository.dart';

class Getorderusecase {
  final Orderrepository repository;
  Getorderusecase({ required this.repository});
  Future<List<OrderEntity>> call() {
    return repository.getOrders();
  }
}
