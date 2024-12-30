import 'package:flutter/cupertino.dart';
import 'package:plant_nursery_zone/model/plant_model.dart';
import 'package:plant_nursery_zone/services/plant_service.dart';

class PlantProvider extends ChangeNotifier{
final _service =PlantService();
List<PlantModel> _plants = [];
List<PlantModel> get plants => _plants;

Future<void> getPlants() async {

  final response = await _service.getALlPlants();
  _plants = response;
  notifyListeners();
}


}