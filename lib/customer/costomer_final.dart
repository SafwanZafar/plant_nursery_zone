import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/customer/home.dart';
import 'package:plant_nursery_zone/customer/order_successfully.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:plant_nursery_zone/model/cart_model.dart';
import 'package:plant_nursery_zone/model/order_model.dart';
import 'package:plant_nursery_zone/provider/order_place_provider.dart';
import 'package:plant_nursery_zone/util/string_util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/app_constant.dart';

import '../util/app_constant.dart';

class CostomerFinal extends StatefulWidget {
  const CostomerFinal({super.key});



  @override
  State<CostomerFinal> createState() => _CostomerFinalState();
}

class _CostomerFinalState extends State<CostomerFinal> {
  String? _name,_email,_contactNumber,_address,_userId;
  @override
  void initState(){
    super.initState();
     _loadData();

  }
  Future<void> _loadData()async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _name = pref.getString('name');
      _email = pref.getString('email');
      _contactNumber = pref.getString('contact_number');
      _address = pref.getString('address');
      _userId = pref.getString('id');
    });
  }

  @override
  Widget build(BuildContext context) {

    final orderProvider = Provider.of<OrderPlaceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context, MaterialPageRoute(builder: (context)=>ShoppingCart()));
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 8,bottom: 8),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // >>>>>>>>>>>>>>>>Personal Information>>>>>>>
                            Row(
                              children: [
                                Icon(Icons.person, color: Colors.green,),
                                Text('Personal Information'),
                              ],
                            ),
                            SizedBox(height: 20,),
                            CustomText(text: 'Name',fontColor: Colors.green.shade300,fontSize: 12,),
                            SizedBox(height: 8,),
                            CustomText(text:_name??''),
                            SizedBox(height: 20,),
                            CustomText(text: 'Email',fontSize: 12,fontColor: Colors.green.shade300,),
                            SizedBox(height: 8,),
                            CustomText(text: _email??''),
                            SizedBox(height: 20,),
                            CustomText(text: 'Contact Number',fontColor: Colors.green.shade300,fontSize: 12,),
                            SizedBox(height: 8,),
                            CustomText(text: _contactNumber??''),
                            SizedBox(height: 20,),
                            CustomText(text: 'Addres',fontColor: Colors.green.shade300,fontSize: 12,),
                            SizedBox(height: 8,),
                            CustomText(text: _address??''),
            
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            
                //>>>>>>>>>>>>>>>>>>>>>Payment method>>>>>>>>>>>>>>>>>>>>>>>>
            
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10),
            
                  child: Card(
                    elevation: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.payment_rounded,color: Colors.green,),
                              SizedBox(width: 5,),
                              CustomText(text: 'Payment Method'),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.radio_button_checked_rounded,color: Colors.green,),
                                SizedBox(width: 5,),
                                CustomText(text: 'Cash on Delivery (COD)'),
                              ],
                            ),
                          ),
            
                        ],
                      ),
                    ),
                  ),
                ),
            
                //>>>>>***************Order Summery>>>>>>>>>>>>>>>>>>>>
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.shopping_cart,color: Colors.green,),
                              SizedBox(width: 5,),
                              CustomText(text: 'Order Summery'),
            
                            ],
                          ),
            
                          SizedBox(height: 200,
                            child: ListView.builder(
                                itemCount: value.cartItems.length,
                                itemBuilder: (context,index){
                                  var item = value.cartItems[index] as CartModel;
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
                                          leading: Image.network(base_url+StringUtil.removeFirstSlash(item.model!.image_Url)),
                                          title: Text(item.model!.name),
                                          subtitle: Column(
                                            children: [
                                              Text('RS:'+item.model!.price),
                                              Text('Quantity : '+item.quantity.toString())
                                            ],
                                          ),


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
                            ),
                          ),

                          // ***************TOTAL********************

                          Padding(
                            padding: const EdgeInsets.all(12) ,
                            child: Divider(

                              color: Colors.green.shade300,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
                            child: Divider(
                              height: 1,
                              color: Colors.green.shade300,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: 'Total',fontSize: 16,fontWeight: FontWeight.bold,),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: CustomText(text: 'Rs: '+value.calculateTotal(),fontWeight: FontWeight.bold,fontSize: 16,),
                              )
                              
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //****************************************8
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Button(onpress: ()async{
                    List<OrderModel> orderList = [];
                      for(var item in value.cartItems){
                        item as CartModel;
                        print(item);
                       orderList.add(OrderModel(user_id:int.parse(_userId.toString())  ,plant_id:item.model!.plant_id as int,quantity:item.quantity as int));

                      };

                      await orderProvider.sendOrder(orderList);
                    if(orderProvider.response != null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: CustomText(text: orderProvider.response!['message'].toString()
                          )
                      )
                      );
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => OrderSuccessfully()));
                    }




                  }, buttonName: 'Proceed to Payment', height: 48, weight: 300, ),
                ),
              ],
            
            ),
          ),
        );
      }
      ),
        );
  }
}
