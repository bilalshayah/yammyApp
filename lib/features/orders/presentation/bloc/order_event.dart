part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

// order_event
final class GetOrderRequested extends OrderEvent {}

// orderDetails_event
final class GetOrderDetails extends OrderEvent {
  final String id;
  const GetOrderDetails({required this.id});
  @override
  List<Object> get props => [id];
}

// cancelOrder_event
final class CancelOrder extends OrderEvent {
  final String id;
  const CancelOrder({required this.id});
   @override
  List<Object> get props => [id];
}
