class AddressModel {
  final String? id;
  final String label;
  final String street;
  final String? building;
  final String? city;
  final String? country;

  AddressModel({
    this.id,
    required this.label,
    required this.street,
    this.building,
    this.city,
    this.country,  bool isDefault=true,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      label: json['label'] ?? '',
      street: json['street'] ?? '',
      building: json['building'],
      city: json['city'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "street": street,
      "building": building ?? "1",
      "floor": "1",
      "apartment": "1",
      "city": city ?? "Beirut",
      "country": country ?? "Lebanon",
    };
  }
}