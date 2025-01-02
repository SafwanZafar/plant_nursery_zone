import 'dart:convert';

import 'package:plant_nursery_zone/model/plant_model.dart';
import 'package:http/http.dart' as http;

import '../util/app_constant.dart';

class PlantService {
  Future<List <PlantModel>> getALlPlants(Map<String, dynamic> params) async {
    var url = Uri.parse(base_url).resolve(plant_url).replace(
        queryParameters: params);
    // print('URL =>${url}' );
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final plants = json.map((e) {
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
    } else
      throw "Some thing wents wrong";
  }

  Future<String> post_plant(Map<String, dynamic> request_data) async {
    var url = Uri.parse(base_url).resolve(nursery_plant);
    try {
      var request = http.MultipartRequest('POST', url);
      request.files.add(
          await http.MultipartFile.fromPath('image', request_data['image']));
      request.fields['nursery_id'] = request_data['nursery_id'];
      request.fields['name'] = request_data['name'];
      request.fields['description'] = request_data['description'];
      request.fields['price'] = request_data['price'];
      request.fields['stock'] = request_data['stock'];

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print(responseData);
        return responseData;
      }
      else {
        throw Exception('Failed to post data ');
      }
    }

    catch (e) {
      throw Exception('Error Occured $e');
    }
  }

  Future<Map<String, dynamic>> delete_plant(String Plant_id) async {
    Map<String, dynamic> param = {
      'plant_id': Plant_id.toString(),
    };
    try {
      var url = Uri.parse(base_url).resolve(nursery_plant).replace(
          queryParameters: param);
      var response = await http.delete(url,
      );

      if (response.statusCode == 200) {
        var response_data = jsonDecode(response.body);
        return response_data;
      }
      else {
        print(response.body);
        throw Exception('Error Occurded ');
      }
    }
    catch (e) {
      throw Exception("Error $e");
    }
  }
}