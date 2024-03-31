class MedicineModel {
  final dynamic id;
  final String scientificName;
  final String tradeName;
  final String manufacturer;
  final dynamic quantityAvailable;
  final dynamic price;
  final DateTime expiryDate;
  final String category;
  MedicineModel({
    required this.id,
    required this.scientificName,
    required this.tradeName,
    required this.manufacturer,
    required this.quantityAvailable,
    required this.price,
    required this.expiryDate,
    required this.category,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
        id: json['id'],
        tradeName: json['trade_name'],
        manufacturer: json['manufacturer'],
        price: json['price'],
        quantityAvailable: json['quantity_available'],
        scientificName: json['scientific_name'],
        category: json["category"],
        expiryDate: DateTime.parse(json['expiry_date']));
  }
}
