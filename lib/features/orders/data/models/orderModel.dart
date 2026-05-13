
class Ordermodel {
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
  final List<OrderItemModel>? orderItems;

  Ordermodel({
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

  factory Ordermodel.fromJson(Map<String, dynamic> json) {
    return Ordermodel(
      id: json['id'],
      orderNumber: json['order_number'],
      status: json['status'],
      restaurantId: json['restaurant_id'],
      addressId: json['address_id'],
      paymentStatus: json['payment_status'],
      paymentMethod: json['payment_method'],
      subtotal: json['subtotal'],
      deliveryFee: json['delivery_fee'],
      discount: json['discount'],
      tax: json['tax'],
      total: json['total'],
      notes: json['notes'],
      estimatedTime: json['estimated_time'],
      couponCode: json['coupon_code'],
      createdAt: json['created_at'],
      orderItems: json['order_items'] is List
          ? (json['order_items'] as List)
                .map((e) => OrderItemModel.fromJson(e))
                .toList()
          : null,
    );
  }
}

class OrderItemModel {
  final String id;
  final String name;
  final String price;
  final int quantity;
  final String? notes;
  final String subtotal;

  OrderItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.notes,
    required this.subtotal,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      notes: json['notes'],
      subtotal: json['subtotal'],
    );
  }
}

