import 'package:flutter/cupertino.dart';
import 'package:plant_nursery_zone/model/plant_model.dart';
import 'package:plant_nursery_zone/services/plant_service.dart';

class PlantProvider extends ChangeNotifier {
  final _service = PlantService();
  List<PlantModel> _plants = [];

  List<PlantModel> get plants => _plants;
  String ? _add_plant_response;

  String ? get add_plant_response => _add_plant_response;
  Map<String, dynamic> ? _delete_response;

  Map<String, dynamic> ? get delete_response => _delete_response;

  Future<void> getPlants(Map<String, dynamic> param) async {
    final response = await _service.getALlPlants(param);
    _plants = response;
    notifyListeners();
  }

  Future<void> add_plant(Map<String, dynamic> request_data) async {
    try {
      _add_plant_response = await _service.post_plant(request_data);
      notifyListeners();
      print(_add_plant_response);
    }
    catch (e) {
      print(e);
    }
    finally {
      notifyListeners();
    }
  }

  Future<void> delete_plant(String plant_id) async {
    try {
      _delete_response = await _service.delete_plant(plant_id);
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
    finally {
      notifyListeners();
    }
  }
}