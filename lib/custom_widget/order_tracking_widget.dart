import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/customer/delievery_manage.dart';

class OrderTrackingWidget extends StatelessWidget {
  OrderTrackingWidget({super.key,
    required this.orderId,
    required this.plantName,
    required this.quantity,
    required this.totalAmount,
    required this.status,
    required this.createAt,
    required this.onPress,
    required this.Controller

  });
  final String orderId;
  final String plantName;
  final String quantity;
  final String totalAmount;
  final String status;
  final String createAt;
  final VoidCallback onPress;

  TextEditingController Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Container(
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
                        CustomText(text:'Order#ORD-'+orderId,fontWeight: FontWeight.bold,fontSize: 15,),
                        Row(
                          children: [
      
                            Icon(Icons.calendar_month,size: 16,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomText(text: DateFormat('dd-MM-yyyy').format(DateTime.parse(createAt))),
                            ),
                          ],
                        )
                      ],
                    ),
      
            Container(
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
                height: 32,
                width: 90,
                child: Center(child: CustomText(text: status))),
      
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
                                    text: plantName,
                                  ),
                                ),
      
                              ],
                            ), // Scalable spacing
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CustomText(
                                text: quantity, // Scalable font
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CustomText(
                          text: 'Rs'+totalAmount,
                        ),
                      ),
                    ],
                  ),
                              ),
                ),

          if(status=="Delivered")
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20,
                  bottom: 20),
              child: InkWell(
                onTap: () {
                 showDialog(context: context, builder: (BuildContext context)=>

                 //********************* AlertDialog************

                 AlertDialog(


                   content: SingleChildScrollView(
                     child: Container(
                       height: 330,
                     child:Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Stack(
                             alignment: Alignment.centerRight,
                             children: [

                               //************ ORDER FEEDBACK TEXT ****************

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.message,color: Colors.green,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: CustomText(text: 'Order Feedback',fontSize: 18,),
                                    ),
                                  ],
                                ),


                               //************Cancel Icon ******************

                               InkWell(
                                 onTap: (){
                                   Navigator.of(context).pop();
                                 },
                                   child: Icon(Icons.cancel_outlined)),
                             ],
                           ),
                         ),

                         //************** ORDER # **********
                         Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: CustomText(text: 'Provide feedback for Order #ORD-'+orderId),
                         ),

                         Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: TextField(
                             controller: this.Controller,
                             maxLines: 5,
                             decoration: InputDecoration(
                               hintText: 'Share your experience...',
                               border: OutlineInputBorder()
                             ),
                           ),
                         ),

                         // *****************Button for cancel and send feedback


                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,),
                              child:
                              //******************* clickable Widget *************
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 38,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                 borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(child: Center(
                                 child: CustomText(
                                   text: 'Cancel',fontSize: 14,),
                                                         )),
                                                       ),
                              ),
                            ),

                             //********************sendFeedBack*******************

                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),
                        child: InkWell(
                          onTap: onPress,
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>DelieveryManage()))
                          child: Container(
                           height: 40,
                           width: 150,
                           decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 10),
                                 child: Icon(Icons.send,color: Colors.white,size: 14,),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: CustomText(
                                   text: 'Submit Feedback',
                                   fontSize: 14,
                                   fontColor: Colors.white,),
                               )
                             ],
                           ),
                          ),
                        ),
                      ),

                           ],
                         )

                       ],
                     )
                                      ),
                   ),)
                 );
                },

                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: CustomText(
                    text: 'Write Feedback',
                    fontColor: Colors.white,
                  )
                  ),
                ),
              ),
            ),

      
      
          ],
                    ),
              ),
    );
  }
}
