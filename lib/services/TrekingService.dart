import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_web/models/campmodel.dart';
import 'package:travel_web/models/trekkingmodel.dart';
import 'package:travel_web/models/trekkingslider.dart';
import 'package:travel_web/providers/bikeprovider.dart';
import 'package:travel_web/providers/trekkingprovider.dart';


class TrekingService{

Future<List<TrekkingModel>>getTeks()async{
  return FirebaseFirestore.instance.collection('Foods').get().then((value) {
  List<TrekkingModel> treks = [];
  for(DocumentSnapshot snapshot in value.docs){
    treks.add(TrekkingModel.fromSnapshot(snapshot));
  }
  return treks;

});


}

Future<List<CampModel>>getCamps()async{
  return FirebaseFirestore.instance.collection('Camps').get().then((value) {
    List<CampModel> camps = [];
    for (DocumentSnapshot snapshot in value.docs){
      camps.add(CampModel.fromSnapshot(snapshot));
    }
    return camps;
  });


}


}