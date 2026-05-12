import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yammyapp/features/orders/data/models/createOrderModel.dart';
import 'package:yammyapp/features/orders/domain/entity/orderEntity.dart';
import 'package:yammyapp/features/orders/domain/usecases/cancelOrderUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/createOrderUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderDetailsUseCase.dart';
import 'package:yammyapp/features/orders/domain/usecases/getOrderUseCase.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final Getorderusecase getorderusecase;
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  final Cancelorderusecase cancelorderusecase;
  final CreateorderUseCase createorderUseCase;
  OrderBloc({
    required this.getorderusecase,
    required this.getOrderDetailsUseCase,
    required this.cancelorderusecase,
    required this.createorderUseCase,
  }) : super(OrderInitial()) {
    on<GetOrderRequested>(_getOrders);
    on<GetOrderDetails>(_getOrderDetails);
    on<CancelOrder>(_cancelOrder);
    on<CreateOrder>(_createOrder);
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

  // createOrder
  Future<void> _createOrder(CreateOrder event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      await createorderUseCase(event.order);
      emit(CreateOrderSuccessfull());
    } catch (e) {
      emit(CreateOrderFailed(message: e.toString()));
    }
  }
}
