import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/repository/orderRepository.dart';

class GetOrderDetailsUseCase {
  Orderrepository orderrepository;
  GetOrderDetailsUseCase({required this.orderrepository});
  Future<OrderEntity> call(String id){
    return orderrepository.getOrderDetails(id) ;
  }
}
