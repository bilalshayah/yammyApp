import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderUseCase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final Getorderusecase getorderusecase;
  OrderBloc({required this.getorderusecase}) : super(OrderInitial()) {
    on<GetOrderRequested>(_getOrders);
  }
  Future<void> _getOrders(
    OrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final orders = await getorderusecase();
      emit(OrderSuccess(orders));
    } catch (e) {
      emit(OrderFailed(e.toString()));
    }
  }
}
