class OrderTrackingModel{
  final int order_id;
  final String Plant_name;
  final int qunatity;
  final double Total_Amount;
  final String Status;
  final String Created_at;

  OrderTrackingModel({
   required this.order_id,
   required this.Plant_name,
    required this.qunatity,
    required this.Total_Amount,
    required this.Status,
    required this.Created_at,
});
}