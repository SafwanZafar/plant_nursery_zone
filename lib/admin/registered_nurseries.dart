import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:http/http.dart' as http;

class RegisteredNurseries extends StatefulWidget {
  const RegisteredNurseries({super.key});

  @override
  State<RegisteredNurseries> createState() => _RegisteredNurseriesState();
}
class _RegisteredNurseriesState extends State<RegisteredNurseries> {
  List<Map<String,dynamic>> items =[{
  }];
  Future<void> fetch_registerd_nurseries() async{
    Map<String,dynamic> params={
      'pending_request':false.toString(),
      'skip':'0',
      'limit':'20'
    };
    var uri = Uri.parse(base_url).resolve(nursery_rquest_url).replace(queryParameters: params);
    var response = await http.get(uri,
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode==200){
      var response_data = (jsonDecode(response.body)as List).map((e)=> e as Map<String,dynamic>).toList();
      items = response_data;
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failled Try Again')));

    }
  }

  @override
  void initState() {
    fetch_registerd_nurseries();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RegisterdNursery',
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
                    Text(
                      "status: ${customer['status']}",
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
