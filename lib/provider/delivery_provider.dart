import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/model/delievery_model.dart';
import 'package:plant_nursery_zone/services/delievery_service.dart';

class DeliveryProvider extends ChangeNotifier{
  final _deliverService = DelieveryService();
  List<DelieveryModel> _deliver = [];
  List<DelieveryModel> get delivers => _deliver;
  Map<String, dynamic>?_updateDeliver;
  Map<String, dynamic>? get updateDeliver => _updateDeliver;

  Future<void> getDeliveries(String user_id)async{
    final response = await _deliverService.getDelievery(user_id);
    _deliver = response;
    notifyListeners();

  }

  Future<void> updateDeliveryStatus(String order_id,status)async{
    try{
      _updateDeliver = await _deliverService.updateDeliveryStatus(order_id, status);
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
  void removeItem(int index) {
    _deliver.removeAt(index);
    notifyListeners(); // Notify the UI to rebuild
  }
}