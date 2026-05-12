import 'package:yammyapp/features/orders/data/models/createOrderModel.dart';
import 'package:yammyapp/features/orders/domain/repository/orderRepository.dart';

class CreateorderUseCase {
  final Orderrepository repository;
  CreateorderUseCase({required this.repository});
  Future<void> call(Createordermodel order) async {
    await repository.createOrder(order);
  }
}
