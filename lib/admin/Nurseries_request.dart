import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:http/http.dart' as http;


import '../custom_widget/button.dart';
class NurseriesRequest extends StatefulWidget {
  const NurseriesRequest({super.key});

  @override
  State<NurseriesRequest> createState() => _NurseriesRequestState();
}

class _NurseriesRequestState extends State<NurseriesRequest> {
  bool is_visible =false;
  List<Map<String,dynamic>> items =[{
  }];
  void initState() {
    fetch_nursery_request();

    super.initState();
  }
  Future<void> fetch_nursery_request() async{
       Map<String,dynamic> Params ={
         'pending_request':true,
         "skip":'0',
         "limit":'20'
       };
       Map<String, String> queryParameters = Params.map((key, value) => MapEntry(key, value.toString()));

       var url =Uri.parse(base_url).resolve(nursery_rquest_url).replace(queryParameters: queryParameters);
       var response = await http.get(url,
         headers: {'Content-Type': 'application/json'},
       );
       if(response.statusCode==200){
         var response_data = (jsonDecode(response.body)as List).map((e) =>e as Map<String,dynamic>).toList();
         setState(() {
           items = response_data;
         });
       }
       else if(response.statusCode==404){
         setState(() {
           setState(() {
             is_visible = true ;

           });

         });

       }
       else
         {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failled Try Again')));
         }
  }
  Future<void> update_nursery_request_status(int nursery_id,bool is_accepted) async{
    Map<String,dynamic> params = {
      'nursery_id':nursery_id.toString(),
      'is_accepted':is_accepted.toString()
    };
    var url = Uri.parse(base_url).resolve(nursery_rquest_url).replace(queryParameters: params);
    var response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
    );
    if(response.statusCode==200){

      var response_data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response_data['message'])));
       fetch_nursery_request();


    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed Try Again')));
    }

  }
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NurseriesRequest',
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
      body:Padding(
        padding: const EdgeInsets.all(12),
        child:is_visible?Center(child: Text('No Request Found')): ListView.builder(
          itemCount: items.length,
            itemBuilder: (context,index){
          final customer = items[index];
          print('Customer =>> $customer');
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${customer['name']}",style: TextStyle(fontSize: 16,),),
                  SizedBox(height: 5,),
                  Text("Email: ${customer['email']}",style: TextStyle(fontSize: 14),),
                  SizedBox(height: 5,),
                  Text("Address: ${customer['address']}",style: TextStyle(fontSize: 14,),),
                  SizedBox(height: 5,),
                  Text("phone: ${customer['contact_number']}",style: TextStyle(fontSize: 16,),),
                  Text("status: ${customer['status']}",style: TextStyle(fontSize: 16,),),
                     Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // update request status api
                         Button(height: 40,weight: 100,buttonName: 'Accept',onpress: (){
                           update_nursery_request_status(customer['nursery_id'], true);
                           // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${index} Accepted')));
                         },),
                        Button(height: 40,weight: 100,buttonName: 'Reject',onpress: (){
                          update_nursery_request_status(customer['nursery_id'], false);

                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${index} Rejected')));
                        },color: Colors.red,),
                      ],),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
