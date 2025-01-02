class FeedBackModel{
  int order_id;
  String comment;
//*************FeedBackModel instance*************
  FeedBackModel({
   required this.order_id,
   required  this.comment,

});

      //************** toJason Function ***************
// Convert the object to JSON
Map<String, dynamic> toJson(){
return {
  'order_id': order_id,
  'comment':comment
};
}



}