import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import 'package:plant_nursery_zone/model/cart_model.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
   const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => PlantDetail()));
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: Colors.green,
          title: CustomText(
            text: 'CART',
            fontColor: Colors.white,
          ),
        ),

        // >>>>>>>>>>>>BODY>>>>>>>>>>>>

     body: Consumer<CartModel>(
         builder: (context, value, child){
           return Column(
             children: [
               Expanded(
                   child: ListView.builder(
                     itemCount: value.cartItems.length,
                       itemBuilder: (context,index){
                       var item = value.cartItems[index];
                       print(item);
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                             child: Container(
                               decoration: BoxDecoration(
                                 color: Colors.grey.shade100,
                                 borderRadius: BorderRadius.circular(12),
                               ),

                               //>>>>>>>List of cart>>>>>

                               child: ListTile(
                                 leading: Image.asset(item["image_url"]),
                                 title: Text(item["name"]),
                                 subtitle: Text('RS:'+item["price"]),

                                 trailing: InkWell(
                                   onTap: ()=>
                                     Provider.of<CartModel>(context,listen: false)
                                         .removeItemFromCart(index),

                                     child: Icon(Icons.cancel)),

                               ),

                             ),
                           ),
                         );
                       }
                   )
               ),

               // >>>>>>total>>>..

               Padding(
                 padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
                 child: Card(
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.grey.shade100,
                       borderRadius: BorderRadius.circular(12)
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(24.0),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [

                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                             CustomText(text:
                             'Total Price',

                             ),
                             CustomText(text:
                             'RS:'+value.calculateTotal(),
                               fontSize: 18,
                               fontWeight: FontWeight.bold,
                             )

                           ],),

                           InkWell(
                             onTap: (){},
                             child: Container(
                               alignment: Alignment.center,
                               margin: EdgeInsets.only(left: 80),
                               width: 90,
                               height: 30,
                               decoration: BoxDecoration(
                                   color: Colors.green,
                                   borderRadius: BorderRadius.circular(5)
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   CustomText(
                                       text: 'Pay Now',
                                   fontColor: Colors.white,
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 2),
                                     child: Icon(Icons.arrow_forward_ios,size: 14,color: Colors.white,),
                                   ),
                                 ],
                               )
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               )

             ],
           );
         }
     ),

    );
  }
}
