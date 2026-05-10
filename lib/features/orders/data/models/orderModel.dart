class Ordermodel {
  final String restaurantId;
  final String addressId;
  final String paymentMethod;
  final String? notes;
  final String? couponCode;

  Ordermodel({
    required this.addressId,
    required this.restaurantId,
    required this.paymentMethod,
    this.couponCode,
    this.notes,
  });

  factory Ordermodel.fromJson(Map<String, dynamic> json) {
    return Ordermodel(
      addressId: json['address_id'],
      restaurantId: json['restaurant_id'],
      paymentMethod: json['payment_method'],
      notes: json['notes'],
      couponCode: json['coupon_code'],
    );
  }
}
