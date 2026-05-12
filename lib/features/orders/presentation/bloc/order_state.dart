part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {
  final List<OrderEntity> orders;
  const OrderSuccess(this.orders);
  @override
  List<Object> get props => [orders];
}

final class OrderFailed extends OrderState {
  final String message;
  const OrderFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class OrderDetailsSuccess extends OrderState {
  final OrderEntity orderDetails;
  const OrderDetailsSuccess({required this.orderDetails});
  @override
  List<Object> get props => [orderDetails];
}

final class OrderDetailsFailed extends OrderState {
  final String message;
  const OrderDetailsFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class OrderCanceledSuccessfully extends OrderState {}

final class OrderCanceledFailed extends OrderState {
  final String message;
  const OrderCanceledFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class CreateOrderSuccessfull extends OrderState {}
final class CreateOrderFailed extends OrderState {
  final String message;
  const CreateOrderFailed({required this.message});
  @override
  List<Object> get props => [message];
}
