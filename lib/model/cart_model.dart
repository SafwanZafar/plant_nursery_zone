import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CartModel extends ChangeNotifier{
  // list of Items on sale

  // final List _shopItems = [
  //   ["Avacado " ,  "400", "asset/plant1.jpg"],
  //   ["lavacado " , "300", "asset/planti2.jpg"],
  //   ["qavacado " , "200", "asset/plant1.jpg"],
  //   ["mavacado " , "100", "asset/planti2.jpg"],
  //   ["savacado " , "50", "asset/plant1.jpg"],
  // ];

  List<Map <String, dynamic>> plants = [
    {
    "nursery_id": 2,
    "plant_id": 1,
    "name": "Sunflower ",
    "description": "halwa",
    "price": "300",
    "stock": 75,
  "image_url": "asset/plant1.jpg"
  },
    {
    "nursery_id": 2,
    "plant_id": 3,
    "name": "Sunflower ",
    "description": "halwa",
    "price": "300",
    "stock": 75,
  "image_url": "asset/plant1.jpg"
  },
    {
    "nursery_id": 2,
    "plant_id": 4,
    "name": "Sunflower ",
    "description": "halwa",
    "price": "300",
    "stock": 75,
  "image_url": "asset/plant1.jpg"
  },


  ];

  //list of cart item
  List<Map<String, dynamic>> _cartItems = [];
  get shopItems => plants;
  get cartItems => _cartItems;

  //add item to cart
 void addItemToCart(Map<String , dynamic>item) {
   if(_cartItems.contains(item)){
     _cartItems.remove(item);
     _cartItems.add(item);
   }
   else{
     _cartItems.add(item);
   }
   print(cartItems);
 }

   //remove from item to cart
   void removeItemFromCart(int index){
     _cartItems.removeAt(index);
     notifyListeners();
   }
   //calculate total price
   String calculateTotal(){
   double totalPrice = 0;
   for(int i = 0; i<_cartItems.length; i++){
     totalPrice += double.parse(_cartItems[i]["price"]);
   }
   return totalPrice.toStringAsFixed(2);
}

 }
