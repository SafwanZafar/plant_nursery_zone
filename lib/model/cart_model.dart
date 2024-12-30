import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/model/plant_model.dart';


class CartModel extends ChangeNotifier{
 PlantModel ? model;
 int ? quantity;


CartModel({
  this.model,
   this.quantity
});


  //list of cart item
  List<CartModel> _cartItems = <CartModel>[];
  get cartItems => _cartItems;

  //add item to cart
 void addItemToCart(CartModel item) {
   print(cartItems);
   for(var _cart in cartItems ){
     _cart as CartModel;
     if(_cart.model!.plant_id == item.model!.plant_id){
       _cartItems.remove(_cart);
       _cartItems.add(item);
       return;
     }
   }
   _cartItems.add(item);


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
     totalPrice +=( double.parse(_cartItems[i].model!.price) * double.parse(_cartItems[i].quantity.toString()));
   }
   return totalPrice.toStringAsFixed(2);
}

 }
