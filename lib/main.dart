import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/admin/admin_dashboard.dart';
import 'package:plant_nursery_zone/authentication/login.dart';
import 'package:plant_nursery_zone/authentication/register.dart';
import 'package:plant_nursery_zone/customer/order_tracking.dart';
import 'package:plant_nursery_zone/model/cart_model.dart';
import 'package:plant_nursery_zone/customer/home.dart';
import 'package:plant_nursery_zone/customer/shopping_cart.dart';
import 'package:plant_nursery_zone/provider/delivery_provider.dart';
import 'package:plant_nursery_zone/provider/feed_back_provider.dart';
import 'package:plant_nursery_zone/provider/order_place_provider.dart';
import 'package:plant_nursery_zone/provider/order_tracking_provider.dart';
import 'package:plant_nursery_zone/provider/plant_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>PlantProvider()),
          ChangeNotifierProvider(create: (context)=>CartModel()),
          ChangeNotifierProvider(create: (context)=>OrderPlaceProvider()),
          ChangeNotifierProvider(create: (context)=>orderTrackingProvider()),
          ChangeNotifierProvider(create: (context)=>FeedBackProvider()),
          ChangeNotifierProvider(create: (context)=>DeliveryProvider()),
        ],

      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Login(),
        // home: Home(),
      ),
    );
  }
}


