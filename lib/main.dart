import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/admin/admin_dashboard.dart';
import 'package:plant_nursery_zone/authentication/login.dart';
import 'package:plant_nursery_zone/authentication/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AdminDashboard(),
    );
  }
}


