import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/model/order_tracking_model.dart';
import 'package:plant_nursery_zone/services/order_tracking_service.dart';

class orderTrackingProvider extends ChangeNotifier{
  final _orderTrackingService = OrderTrackingService();
  List<OrderTrackingModel> _orderTracks = [];
  List<OrderTrackingModel> get orderTracks => _orderTracks;
  
  Future<void> getOrderTracking(String user_id)async{
    final response = await _orderTrackingService.getOrderTracking(user_id);
    _orderTracks = response;
    notifyListeners();
  }
}