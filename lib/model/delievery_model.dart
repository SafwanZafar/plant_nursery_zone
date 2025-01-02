class DelieveryModel{
  int delivery_id;
  int order_id;
  String name;
  String address;
  String contact_number;
  String schedule_date;
  String status;

  DelieveryModel({
   required this.delivery_id,
   required this.order_id,
   required this.name,
   required this.address,
   required this.contact_number,
   required this.schedule_date,
   required this.status,
});

}