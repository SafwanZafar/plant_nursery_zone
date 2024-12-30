import 'dart:convert';

import 'package:plant_nursery_zone/model/plant_model.dart';
import 'package:http/http.dart' as http;

import '../util/app_constant.dart';

class PlantService{
Future<List <PlantModel>> getALlPlants()async{
        Map<String,dynamic> param = {
          "skip": 0.toString(),
          "limit": 20.toString()
        };
        var url =Uri.parse(base_url).resolve(plant_url).replace(queryParameters: param);
        // print('URL =>${url}' );
          final response = await http.get(url);
          print(response.body);
          if(response.statusCode == 200){
            final json = jsonDecode(response.body)as List;
            final plants = json.map((e){
                 return PlantModel(price: e['price'],
                     description: e['description'],
                     name: e['name'],
                     nursery_id: e['nursery_id'],
                     plant_id: e['plant_id'],
                     stock: e['stock'],
                     image_Url: e['image_url']

                 );
            }).toList();
            return plants;
          }else
          throw "Some thing wents wrong";
}
}