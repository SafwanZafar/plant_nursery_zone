import 'dart:convert';

import 'package:plant_nursery_zone/model/delievery_model.dart';
import 'package:http/http.dart' as http;
import 'package:plant_nursery_zone/util/app_constant.dart';

class DelieveryService{
  Future<List<DelieveryModel>> getDelievery(String user_id)async{
    Map<String, dynamic> parameters = {
           "user_id":user_id.toString()
    };
    var url = Uri.parse(base_url).resolve(deliverySchedul_url).replace(queryParameters: parameters);
    final response = await http.get(url);
    print(response.body);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body)as List;
      final delieveries = json.map((e){
        return DelieveryModel(
            delivery_id: e['delivery_id'],
            order_id: e["order_id"],
            name: e['name'],
            address: e['address'],
            contact_number: e['contact_number'],
            schedule_date: e['schedule_date'],
            status: e['status']);
      }).toList();
      return delieveries;
    }else{
      throw 'SomeThing Went Wrong';
    }
  }

  Future<Map<String,dynamic>> updateDeliveryStatus(String order_id,status)async{
      Map<String,dynamic> params = {
        "order_id": order_id.toString(),
        "status": status.toString(),
      };
      var urls = Uri.parse(base_url).resolve(updateDeliveryStatus_url).replace(queryParameters: params);
      try {
        final responses = await http.put(urls);
        if (responses.statusCode == 200) {
          return jsonDecode(responses.body);
        }
        else throw Exception(responses.body);
      }catch(e){
        throw Exception('Error Occurred $e');
      }
  }

}
