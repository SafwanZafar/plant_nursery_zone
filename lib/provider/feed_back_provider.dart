import 'package:flutter/material.dart';
import 'package:plant_nursery_zone/model/feed_back_model.dart';
import 'package:plant_nursery_zone/services/feed_back_service.dart';

class FeedBackProvider extends ChangeNotifier{
  final _feedBackService = FeedBackService();
  Map<String,dynamic>? _response;
  Map<String, dynamic>? get response => _response;

  Future<void> sendFeedBack(FeedBackModel feedback)async{
    try{
      _response = await _feedBackService.postFeedback(feedback);
    }
    catch (e){
      print('Error: $e');
    }
    finally {
      notifyListeners();
    }
  }
}