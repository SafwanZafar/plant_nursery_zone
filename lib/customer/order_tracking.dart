import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/custom_widget/order_tracking_widget.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import 'package:plant_nursery_zone/model/feed_back_model.dart';
import 'package:plant_nursery_zone/provider/feed_back_provider.dart';
import 'package:plant_nursery_zone/provider/order_tracking_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_widget/textfield.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key
  });



  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  String? _user_id;
  final TextEditingController commentController = TextEditingController();
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)async{
      Provider.of<orderTrackingProvider>(context,listen: false).getOrderTracking(_user_id.toString());
    });

    _loadData();
  }
  Future<void> _loadData()async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _user_id = pref.getString('id');
    });

    if(_user_id != null){
      Provider.of<orderTrackingProvider>(context,listen: false).getOrderTracking(_user_id!);
    }
  }

  @override
  // void initStates(){
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp)async{
  //     Provider.of<orderTrackingProvider>(context,listen: false).getOrderTracking(_user_id.toString());
  //   });
  // }
  Widget build(BuildContext context) {
    final feedbackProvider = Provider.of<FeedBackProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              // Navigator.pop(
              //     context,MaterialPageRoute(builder: (context)=>PlantDetail()));
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
        title:CustomText(text: 'ORDER TRACKING',fontColor: Colors.white,),
      ),
      body:
          Consumer<orderTrackingProvider>(
            builder: (context, value, child){
              final orderTrackss = value.orderTracks;

              if(orderTrackss.isEmpty){
                return Center(
                  child: Text('No Order to Display'),
                );
              }
              return ListView.builder(
              itemCount: orderTrackss.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context,index){
                var item = orderTrackss[index];
                return OrderTrackingWidget(
                     orderId: item.order_id.toString(),
                     plantName: item.Plant_name,
                     quantity: item.qunatity.toString(),
                     totalAmount: item.Total_Amount.toString(),
                     status: item.Status,
                     createAt: item.Created_at,
                     onPress: (){
                       print('halwaaa');
                       FeedBackModel feedBack = FeedBackModel(order_id: item.order_id, comment: commentController.text);
                       print(jsonEncode(feedBack.toJson()));
                       feedbackProvider.sendFeedBack(feedBack);
                       if(feedbackProvider.response != null){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             content: Text('Feedback Submited Successfully')));
                         Navigator.of(context).pop();
                       }
                     },
                  Controller: commentController,

                   );
            }
            );
  }
          ),
    );
  }
}


