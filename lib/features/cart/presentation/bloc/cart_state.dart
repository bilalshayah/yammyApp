import '../../data/models/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartFetched extends CartState {
  final CartModel cart;
  CartFetched(this.cart);
}

class CartError extends CartState {
  final String message; CartError(this.message);
}