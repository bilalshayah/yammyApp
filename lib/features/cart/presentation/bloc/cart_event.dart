
abstract class CartEvent {}

class FetchCart extends CartEvent {}

class ItemDelete extends CartEvent {
  final String itemId;
  ItemDelete({required this.itemId});
}

class IncrementQuantity extends CartEvent {
  final String itemId;
  IncrementQuantity(this.itemId);
}

class DecrementQuantity extends CartEvent {
  final String itemId;
  DecrementQuantity(this.itemId);
}