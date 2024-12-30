import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/customer/home.dart';
import 'package:plant_nursery_zone/customer/order_tracking.dart';
import 'package:plant_nursery_zone/customer/plant_item_tile.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:plant_nursery_zone/model/plant_model.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';
import '../util/app_constant.dart';
import '../util/string_util.dart';

class PlantDetail extends StatefulWidget {
  final PlantModel  plantDetails;

   PlantDetail({super.key,
    this.onTap,required this.plantDetails});

  void Function() ? onTap;

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
 int _counter = 1;

  void incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void decrementCounter(){
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context,MaterialPageRoute(builder: (context)=>Home()));
          },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
        title: Text('Plant Detail',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCart()));
          }, icon: Icon(Icons.shopping_cart,color: Colors.white,))
        ],

      ),
      body: Consumer<CartModel>(
        builder: (BuildContext context, value,  child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green.shade50,
                // height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child:   Image.network(
                    height: 235,
                      (base_url+StringUtil.removeFirstSlash(widget.plantDetails.image_Url))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: CustomText(text: widget.plantDetails.name,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: CustomText(
                  text: 'RS:'+widget.plantDetails.price, fontWeight: FontWeight.bold, fontSize: 18,),
              ),
              SizedBox(height: 20,),
              Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        // top: 20,
                          left: 20),
                      child: CustomText(text: 'Quantity', fontSize: 16,),
                    ),

                    Row(children: [
                      InkWell(onTap: () {
                        if (_counter > 1) {
                          decrementCounter();
                        }
                      },
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(child: Text('-', style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),))
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomText(text: '$_counter', fontSize: 20,),
                      ),

                      InkWell(
                        onTap: () {
                          if(_counter < widget.plantDetails.stock)
                          incrementCounter();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green.shade300
                          ),
                          child: Center(child: CustomText(text: '+',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,)),
                        ),
                      )


                    ]
                    ),
                  ]
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(text: 'Description :-', fontSize: 15,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                child: CustomText(
                  text: widget.plantDetails.description,
                  fontSize: 13,),
              ),
              SizedBox(height: 80,),
              InkWell(
                onTap: (){
                  Provider.of<CartModel>(context,listen: false).
                  addItemToCart(CartModel(model: widget.plantDetails, quantity: _counter) );

                },
                child: Center(
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)

                    ),
                    child: Center(child: CustomText(text: 'Add to Cart',
                      fontColor: Colors.white,
                      fontSize: 15,)),
                  ),
                ),
              ),

            ],
          );
        }

          )
      );

  }
//  onTap:(){
//  Provider.of<CartModel>(context,listen: false).addItemToCart(index);
// // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCart()));
// },
}