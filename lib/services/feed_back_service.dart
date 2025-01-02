import 'dart:convert';

import 'package:plant_nursery_zone/model/feed_back_model.dart';
import 'package:plant_nursery_zone/util/app_constant.dart';
import 'package:http/http.dart' as http;


class FeedBackService{
  Future<Map<String,dynamic>> postFeedback(FeedBackModel feedBack)async{
    final url = Uri.parse(base_url).resolve(feedback_url);

    try{
      final response = await http.post(
        url,
        headers: {
          'Content-Type':'application/json',
        },
        body: json.encode(feedBack.toJson()),
      );
      if(response.statusCode ==200){
        print("success==>>");
        return json.decode(response.body);
      }else{
        throw Exception('Failed top post data ${response.body}');
      }
    }
    catch (e){
      throw Exception('Error occure: $e');
    }
  }
}