class OrderEntity {
 final String id;
  final String? orderNumber;
  final String? status;
  final String restaurantId;
  final String addressId;
  final String? paymentStatus;
  final String? paymentMethod;
  final String? subtotal;
  final String? deliveryFee;
  final String? tax;
  final String? total;
  final String? notes;
  final String? couponCode;
  final String? createdAt;
  final String? discount;
  final String? estimatedTime;
  final List<OrderItemEntity>? orderItems;

  OrderEntity({
    required this.id,
     this.orderNumber,
     this.status,
    this.paymentStatus,
    this.paymentMethod,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.notes,
    this.couponCode,
    this.createdAt,
    this.orderItems, required this.restaurantId, required this.addressId, this.tax, this.discount, this.estimatedTime,
  });
}

class OrderItemEntity {
  final String id;
  final String name;
  final String price;
  final int quantity;
  final String? notes;
  final String subtotal;

  OrderItemEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.notes,
    required this.subtotal,
  });
}