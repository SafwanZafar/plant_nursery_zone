import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';

class OrderTrackingWidget extends StatelessWidget {
  const OrderTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //*******************Order****************

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
            child: Stack(
                       alignment: Alignment.centerRight,
                children:[

                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      CustomText(text:'Order #ORD-1004'),
                      Row(
                        children: [

                          Icon(Icons.calendar_month,size: 16,),
                          CustomText(text: '12/27/2024'),
                        ],
                      )
                    ],
                  ),

          Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
              height: 32,
              width: 90,
              child: Center(child: CustomText(text:'Pending'))),

            ]
          )
          ),

          //Customer container

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
            child: Container(
              height: 48,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8)
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(Icons.person,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CustomText(text: 'Customer'),
                    ),
                  ],
                ),
              )
            ),
          ),

//***********************************************************************

          SizedBox(
            height: 20,
          ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 1),
                                child: CustomText(
                                  text: 'Holly',
                                ),
                              ),

                            ],
                          ), // Scalable spacing
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CustomText(
                              text: 'Quantity: 1', // Scalable font
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CustomText(
                        text: 'Rs700',
                      ),
                    ),
                  ],
                ),
                            ),
              ),


        ],
                  ),
            );
  }
}
