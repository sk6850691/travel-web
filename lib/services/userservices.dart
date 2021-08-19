import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_web/models/bikemodel.dart';
import 'package:travel_web/models/cartItemmodel.dart';

class UserService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collection = "users";



  addToCart({String userId, cartitem})async{

    await firestore.collection(collection).doc(userId).update({

      "cart":FieldValue.arrayUnion([cartitem])
    });


  }




}