class OrderModel{
  final int user_id;
  final int plant_id;
  final int quantity;

  OrderModel({
    required this.user_id,
    required this.plant_id,
    required this.quantity,
});

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'plant_id': plant_id,
      'quantity': quantity,
    };
  }
}