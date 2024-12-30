import 'dart:io';
import 'package:flutter/material.dart';
class ManagePlant extends StatefulWidget {

   ManagePlant({super.key,});

  @override
  State<ManagePlant> createState() => _ManagePlantState();
}

class _ManagePlantState extends State<ManagePlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Plant"),
        centerTitle: true,
      ),
      body: Text('data'),
    );
  }
}
