class MenuItemModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double effectivePrice;
  final double rating;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.effectivePrice,
    this.rating = 4.5,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      effectivePrice: double.tryParse(json['effective_price'].toString()) ?? 0.0,
    );
  }
}