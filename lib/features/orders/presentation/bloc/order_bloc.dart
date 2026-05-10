import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/usecases/cancelOrderUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderDetailsUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderUseCase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final Getorderusecase getorderusecase;
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final Cancelorderusecase cancelorderusecase;
  OrderBloc({
    required this.getorderusecase,
    required this.getOrderDetailsUseCase,
    required this.cancelorderusecase,
  }) : super(OrderInitial()) {
    on<GetOrderRequested>(_getOrders);
    on<GetOrderDetails>(_getOrderDetails);
    on<CancelOrder>(_cancelOrder);
  }
  // get all orders
  Future<void> _getOrders(
    GetOrderRequested event,
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

  // getOrderDetails
  Future<void> _getOrderDetails(
    GetOrderDetails event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      final orderDetails = await getOrderDetailsUseCase(event.id);
      emit(OrderDetailsSuccess(orderDetails: orderDetails));
    } catch (e) {
      emit(OrderDetailsFailed(message: e.toString()));
    }
  }

  // cancelOrder
  Future<void> _cancelOrder(CancelOrder event, Emitter<OrderState> emit) async {
    emit(OrderLoading());

    try {
      await cancelorderusecase(event.id);
      emit(OrderCanceledSuccessfully());
    } catch (e) {
      emit(OrderCanceledFailed(message: e.toString()));
    }
  }
}
