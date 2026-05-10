class OrderEntity {
  final String restaurantId;
  final String addressId;
  final String paymentMethod;
  final String? notes;
  final String? couponCode;

  OrderEntity({
    required this.addressId,
    required this.restaurantId,
    required this.paymentMethod,
    this.couponCode,
    this.notes,
  });
}
