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
