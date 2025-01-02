import 'dart:convert';

import 'package:plant_nursery_zone/model/order_tracking_model.dart';
import 'package:plant_nursery_zone/model/plant_model.dart';
import 'package:http/http.dart' as http;

import '../util/app_constant.dart';


class OrderTrackingService{
      Future<List<OrderTrackingModel>> getOrderTracking(String user_id )async{

    Map<String, dynamic> params = {
      "skip": 0.toString(),
      "limit":20.toString(),
      "user_id":user_id

    };
    var url = Uri.parse(base_url).resolve(order_tracking_url+"/$user_id").replace(queryParameters: params);
    final response  = await http.get(url);
    print(url);

    if(response.statusCode == 200){
      final toJson = jsonDecode(response.body)as List;
      final orderTrack = toJson.map((e){
        return OrderTrackingModel(
          order_id: e['order_id'],
          Plant_name: e['Plant_name'],
          qunatity: e['qunatity'],
          Total_Amount: e['Total_Amount'],
          Status: e['Status'],
          Created_at: e['Created_at'],
        );
      }).toList();
      return orderTrack;
    }
    else
      throw "Some thing Went Wrong";

  }
}