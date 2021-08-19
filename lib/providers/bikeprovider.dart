import 'package:flutter/material.dart';
import 'package:travel_web/models/bikemodel.dart';
import 'package:travel_web/models/trekkingmodel.dart';
import 'package:travel_web/models/trekkingslider.dart';
import 'package:travel_web/services/TrekingService.dart';
import 'package:travel_web/services/bikeservices.dart';
class BikeProvider with ChangeNotifier{

  BikeService service = BikeService();
  List<BikeModel> bikes = [];




  BikeProvider.initialize(){




  }

  Future getBikes()async{

    bikes = await service.getBikes();
    notifyListeners();
  }






}