import 'dart:collection';
import 'package:travel_web/models/campmodel.dart';
import 'package:travel_web/models/trekkingmodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:travel_web/services/TrekingService.dart';

class TrekingProvider with ChangeNotifier{

  List<TrekkingModel> treks = [];
  TrekingService trekingService = TrekingService();
  List<CampModel> camps = [];

  TrekingProvider.initialize(){

    getTreks();

getCamps();
notifyListeners();


  }

  Future getTreks()async{

    treks = await trekingService.getTeks();
    notifyListeners();
  }
  Future getCamps()async{
    camps = await trekingService.getCamps();
    notifyListeners();
  }




}