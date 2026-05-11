import 'package:yammyapp/features/orders/domain/repository/orderRepository.dart';

class Cancelorderusecase {
  final Orderrepository orderrepository;
  Cancelorderusecase({required this.orderrepository});
  Future<void> call(String id) async {
    await orderrepository.cancelOrder(id);
  }
}
