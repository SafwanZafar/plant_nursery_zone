import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/custom_widget/button.dart';
import 'package:plant_nursery_zone/custom_widget/custom_text.dart';
import 'package:plant_nursery_zone/customer/home.dart';
import 'package:plant_nursery_zone/customer/order_tracking.dart';

class OrderSuccessfully extends StatefulWidget {
  const OrderSuccessfully({super.key});

  @override
  State<OrderSuccessfully> createState() => _OrderSuccessfullyState();
}

class _OrderSuccessfullyState extends State<OrderSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Card(
            elevation: 3,
            color: Colors.white70,
            child: Container(
              height: 400,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 80,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomText(
                      text: 'Order Successfull!',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black87,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomText(
                      text:
                          'Your order has been placed\n            successfully',
                      fontColor: Colors.grey,
                    ),
                  ),
                  Button(
                    onpress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                    },
                    buttonName: 'Go to Home',
                    height: 60,
                    weight: 250,
                    icon: Icons.home,
                  ),
                  Button(
                    onpress: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderTracking()));
                    },
                    buttonName: 'Track Order',
                    height: 60,
                    weight: 250,
                    icon: Icons.delivery_dining,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
