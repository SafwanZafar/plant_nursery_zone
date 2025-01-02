import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';

class DelieveryManageWidget extends StatelessWidget {
     DelieveryManageWidget({super.key,
     required this.orderId,
     required this.name,
     required this.address,
     required this.contactNumber,
     required this.ScheduleDate,
     required this.status,
     required this.onValueChanged,
     this.selectedValue
   });

  String? selectedValue;
  String orderId;
  String name;
  String address;
  String contactNumber;
  String ScheduleDate;
  String status;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20),
                        child: CustomText(text:'Order#'+orderId),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(top: 5,left: 20),
                         child: Row(
                          children: [
                           const Icon(Icons.calendar_month,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: CustomText(text: ScheduleDate),
                            ),
                          ],
                         ),
                       )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top: 10),
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: CustomText(text: status)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.person,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CustomText(text: name),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //***************** PHONE NUMBER ***************

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                     const Icon(Icons.phone,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CustomText(text: contactNumber),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //************************ADDRESS*****************

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                   const Icon(Icons.home,),
                    CustomText(text: address),
                  ],
                ),
              ),
            ),
            //************************

           const Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Divider(
                height: 1,

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: CustomText(text: 'Change Status'),
            ),

            //**************************** CHOOSE STATUS******************

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,),
                  child: DropdownButtonFormField<String>(
                    value: selectedValue,

                      decoration: InputDecoration(
                        border: InputBorder.none

                      ),

                      hint: CustomText(text: 'Choose Status'),
                      items: [
                        DropdownMenuItem(
                            value:'Delivered',
                            child: CustomText(
                                text: 'Delivered')
                        ),

                        DropdownMenuItem(
                            value:'Cancelled',
                            child: CustomText(
                                text: 'Cancelled')
                        ),
                      ], onChanged:(value){
                        if(value!=null) {
                          onValueChanged(value);
                        }

                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
