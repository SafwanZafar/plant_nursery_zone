import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
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
              Navigator.pop(
                  context,MaterialPageRoute(builder: (context)=>PlantDetail()));
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
        title:CustomText(text: 'ORDER TRACKING',fontColor: Colors.white,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Textfield(
            name: 'Enter Order Number',
            Controller: TextEditingController()),
          Center(child: Button(onpress: (){}, buttonName: 'TRACK ORDER',height: 48,weight: 250,)),
          
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Row(
              children: [
                CustomText(text: 'ORDER #',fontSize: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(text: '1234653',fontSize: 14,),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Row(
              children: [
             
                CustomText(text: 'NAME :',fontSize: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomText(text: 'USAMA UMER',fontSize: 14,),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Row(
              children: [
                CustomText(text: 'STATUS :',fontSize: 18,),
                CustomText(text: 'ON ROUTE',fontSize: 14,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
