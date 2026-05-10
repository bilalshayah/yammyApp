part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
  
}
// order_event.dart
final class GetOrderRequested extends OrderEvent{}
