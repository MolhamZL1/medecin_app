class OrderModel {
  final dynamic ordernumber;
  final String status;
  final dynamic totalPrice;
  final dynamic totalQuantity;
  final String paid;
  final dynamic medicines;
  final DateTime date;
  OrderModel(
      {required this.ordernumber,
      required this.status,
      required this.totalPrice,
      required this.totalQuantity,
      required this.paid,
      required this.medicines,
      required this.date});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        ordernumber: json["ordernumber"],
        status: json["status"],
        totalPrice: json["total_price"],
        totalQuantity: json["total_quantity"],
        paid: json["paid"],
        date: DateTime.parse(json["date"]),
        medicines: json["medicines"]);
  }
}
