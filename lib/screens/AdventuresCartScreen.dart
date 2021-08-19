import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travel_web/models/bikemodel.dart';
import 'package:travel_web/models/trekkingmodel.dart';
import 'package:travel_web/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:travel_web/screens/scootydetails.dart';
import 'package:travel_web/services/orders.dart';
class CartScreen extends StatefulWidget {
  final String description;


  final String price;
  final String guests;
  final DateTime dateTime;
  final trek;




  const CartScreen({Key key,this.trek,this.guests,this.price,this.description,this.dateTime}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {



  OrderService service = OrderService();
  Razorpay _razorpay;
  UserProvider provider = UserProvider.intialize();
  TextEditingController couponController = TextEditingController();
  String Price = '';

  getPrice(){

    return Price = widget.price.toString();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    getPrice();



  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_yuPK8L6sbL0LTk',
      'amount': widget.price.toString(),
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };


    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response){
    if(response!=null){
      service.createOrder(cart: provider.cartitem);

      Navigator.pop(context,MaterialPageRoute(builder: (context)=>ScootyDetails()));
    }



  }
  _handlePaymentError(){


  }



  @override
  Widget build(BuildContext context) {

    final userProvider  = Provider.of<UserProvider>(context);


    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
          children: [
            Padding(

              padding:EdgeInsets.only(top: 20,left: 100) ,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
            Text(widget.description.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
            Text(Price.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
            Text(Price.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
            Text(widget.dateTime.toString().substring(0,10),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),)
                ]),


            ),

            SizedBox(height: 40,),

            Card(
              child: Column(
                children: [
                  Text('Guest Details', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 30)
                    ,),

                  Row(
                    children: [
                      ClipRRect(),
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' shubh karan', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20)),
                            Text('shubhkaran828@gmail.com', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20)),
                            Text('+917527910117', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20))

                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),




            SizedBox(height:30),
            TextField(

                  decoration: InputDecoration(
                    hintText: 'Enter Coupon'
                  ),

                  controller: couponController,



                ),
                  IconButton(onPressed: (){
                   if(couponController.value !=null){
                     setState(() {
                       Price.toString() == 300;
                     });
                   }else{
                     return null;
                   }


                  }, icon: Icon(Icons.local_offer_rounded))
              ,



            FlatButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minWidth: 400,
                child: Text('place order'),

                onPressed: (){
                  openCheckout();
                }
            )




          ],)
        )
    );
  }
}
