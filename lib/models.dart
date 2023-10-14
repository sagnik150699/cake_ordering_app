class OrderStatusModel {
  OrderStatusModel({
    required this.documentID,
    required this.name,
    required this.price,
    required this.size,
    required this.status,
    required this.userId,
  });
  final documentID;
  final String name;
  final String price;
  final int size;
  final int status;
  final String userId;

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        documentID: json["documentID"],
        name: json["name"],
        price: json["price"],
        size: json["size"],
        status: json["status"],
        userId: json["userID"],
      );
}
