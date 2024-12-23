import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:http/http.dart' as http;


class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  List<Map<String,dynamic>> items =[{

  }];
  Future<void> fetch_customers() async{
    Map<String,String> Params = {
      "skip":'0',
      "limit":'20'
    };
   var url =Uri.parse(base_url).resolve(customers_url).replace(queryParameters: Params);
   var response = await http.get(url,
     headers: {'Content-Type': 'application/json'},
   );
   if(response.statusCode ==200){
     var response_data = (jsonDecode(response.body)as List).map((e)=>e as Map<String,dynamic>).toList();
     items = response_data;

   }
   else {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failled')));
   }
  }
  @override
  void initState() {
    fetch_customers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final customer = items[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${customer['name']}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Email: ${customer['email']}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Address: ${customer['address']}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Phone: ${customer['contact_number']}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
