import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/model/order_model.dart';
import 'package:plant_nursery_zone/services/order_service.dart';

class OrderPlaceProvider extends ChangeNotifier{
  final _orderService = OrderService();
  Map<String , dynamic>? _response;
  Map<String , dynamic>? get response => _response;

  Future<void> sendOrder(List<OrderModel> orderData)async{
    try{
      _response = await _orderService.postOrderData(orderData);
    }
    catch (e){
      print('Error: $e');
    }
    finally {
      notifyListeners();
    }
  }
}