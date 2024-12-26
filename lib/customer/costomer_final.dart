import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/customer/home.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';

class CostomerFinal extends StatefulWidget {
  const CostomerFinal({super.key});

  @override
  State<CostomerFinal> createState() => _CostomerFinalState();
}

class _CostomerFinalState extends State<CostomerFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context, MaterialPageRoute(builder: (context)=>ShoppingCart()));
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            height: 250,

            child:Image(image: NetworkImage('https://images.immediate.co.uk/production/volatile/sites/10/2018/02/3aa7e6ab-3dea-4440-8825-78ce8556fc6a-45fbc11.jpg?quality=90&webp=true&resize=1500,1001'))),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                CustomText(text: 'Order #',fontSize: 18,fontWeight: FontWeight.bold,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(text: '123439838483',fontSize: 16,),
                ),
              ],
            ),
          ),
          
          //>>>>>>>>>>>>>>>text for Place>>>>>>>>>>>>>>>>>>>>>>>
            SizedBox(height: 10,),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10 ),
              child: CustomText(text: 'Place:',fontSize: 18,fontWeight: FontWeight.bold,),
            ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: CustomText(
                    text: 'Dak Khana Village Post Office, Chahan Tehsil Zilla Rawalpindi, Chakri Road',
                    fontSize: 16,
                    softWrap: true,
                    textOverflow: TextOverflow.visible,
                  ),
                ),
              )

            ]
          ),
         SizedBox(height: 10,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(text: 'Status:',fontSize: 18,fontWeight: FontWeight.bold,),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(text: 'Successfull',fontSize: 16,),
              ),
            ],
          ),
          Button(onpress: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
          }, buttonName: 'Continue to shopping'),

        ],
      ),
    );
  }
}
