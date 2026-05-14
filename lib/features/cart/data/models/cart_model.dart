class CartModel {
  final String id;
  final List<CartItemModel> cartItems;
  final double subtotal;
  final int totalItems;

  CartModel({
    required this.id,
    required this.cartItems,
    required this.subtotal,
    required this.totalItems,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      subtotal: double.tryParse(json['subtotal'].toString()) ?? 0.0,
      totalItems: json['total_items'] ?? 0,
      cartItems: (json['cart_items'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }
}

class CartItemModel {
  final String id;
  final DateTime addedAt;
  final MenuItemModel menuItem;
  int quantity;
  final double itemTotal;

  CartItemModel({
    required this.id,
    required this.menuItem,
    required this.quantity,
    required this.itemTotal,
    required this.addedAt,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      quantity: json['quantity'] ?? 0,
      addedAt: DateTime.parse(json['menu_item']['created_at'] ?? DateTime.now().toString()),
      itemTotal: double.tryParse(json['item_total'].toString()) ?? 0.0,
      menuItem: MenuItemModel.fromJson(json['menu_item']),
    );
  }
}

class MenuItemModel {
  final String name;
  final String image;
  final double price;
  final DateTime createdAt;

  MenuItemModel({required this.name, required this.image, required this.price, required this.createdAt});

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      createdAt: json['created_at'] ?? 0,
    );
  }
}