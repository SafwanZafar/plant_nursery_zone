import 'dart:convert';

import 'package:plant_nursery_zone/model/order_model.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:http/http.dart' as http;

class OrderService{
  Future<Map<String,dynamic>> postOrderData(List<OrderModel> order)async{
    final url = Uri.parse(base_url).resolve(place_order_url);

    try{
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(order),
      );
      if(response.statusCode == 200 ){
        return json.decode(response.body);
      }else{
        throw Exception('Failed to post data: ${response.body}');
      }
    }
    catch (e){
      throw Exception('Error occured:$e');
    }
  }
}