import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/custom_widget/order_tracking_widget.dart';
import 'package:plant_nursery_zone/customer/plant_detail.dart';
import '../custom_widget/textfield.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ListView.builder(
            itemCount: 4,
              padding: EdgeInsets.all(8),
              itemBuilder: (context,index){
               return
                 Card(
                   elevation: 3,
                     color: Colors.grey,
                     child: OrderTrackingWidget()
                 );
          }
          ),
    );
  }
}
