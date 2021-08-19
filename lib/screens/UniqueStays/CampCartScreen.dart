import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travel_web/services/orders.dart';
import 'package:travel_web/widgets/coloredBox.dart';


class CampCartScreen extends StatefulWidget {

  final String description;
  final cartItem;


  final int price;
  final String guests;
  final List dates;
  final camp;
  final displayimage;



  const CampCartScreen({Key key,this.cartItem,this.displayimage,this.description,this.price,this.guests,this.dates,this.camp}) : super(key: key);

  @override
  _CampCartScreenState createState() => _CampCartScreenState();
}

class _CampCartScreenState extends State<CampCartScreen> {
  Razorpay _razorpay;
  int Price  = 0;
  OrderService service = OrderService();
  String textfield = '';
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  double twenty = 0.2;
  String uid = '';

  List paymentmode = [

    'Pay at Site',
    '20% Payment Site',
    'Full Payment Online'
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    getuid();






  }

  getuid()async{

    //SharedPreferences prefs = await  SharedPreferences.getInstance();
    //uid =   prefs.getString('uid');
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_nMM16kyBQikwGY',
      'amount': 200,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '+917527910117', 'email': 'test@razorpay.com'},
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
      //service.createOrder(cart: provider.cartitem);

      //Navigator.pop(context,MaterialPageRoute(builder: (context)=>ScootyDetails()));
    }



  }
  _handlePaymentError(){


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: SingleChildScrollView(
            child:


            Column(




              children: [


                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[

                        ClipRRect(

                          child: Image.network(widget.displayimage,fit: BoxFit.fitHeight,cacheWidth: 100,cacheHeight: 100,),borderRadius: BorderRadius.circular(20),),


                        SizedBox(width: 20,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [Text(widget.description.toString(),style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.w600),),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )




                        /* Column(



                            children:[
                              Text(widget.description.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.w900),),
                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                  width: 200,
                                  height: 200,
                                  child: Column(
                                    children: widget.dates.map((e) {
                                      return Text(e.toString().substring(0,10) );
                                    }).toList(),
                                  )
                              ),

                              Text(Price.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
                              // Text(Price.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
                              SizedBox(
                                height: 10,),

                              //oText(widget.dateTime.toString().substring(0,10),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),)
                            ]),*/
                      ]),
                ),



                SizedBox(height: 40,),

                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10
                  ),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Your Trip',style: GoogleFonts.lato(fontSize: 25,fontWeight: FontWeight.w900),),
                        ListTile(
                          leading: Icon(Icons.date_range),title: Text('Dates',style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w900),),subtitle: Row(children: [Text(widget.dates[0].toString().substring(0,10) + '  To  '+ widget.dates[1].toString().substring(0,10))],),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text('Guests',style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 20),),
                          subtitle: Text(widget.guests),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(Icons.roofing),
                          title: Text('Camp Type',style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w900),),
                          subtitle: Text('Alpine Tent'),
                        )


                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  height: 300,
                  child: Card(

                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Guest Details', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.w900,fontSize: 25)
                            ,),

                          Row(
                            children: [
                              Container(
                                  width: 100,
                                  height: 100,

                                  child:
                                  ClipRRect(
                                    child: Image.asset("assets/call-center-agent.png"),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(' shubh karan', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.w900,fontSize: 25)),
                                    SizedBox(height: 10,),

                                    Text('shubhkaran828@gmail.com', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20)),
                                    SizedBox(height: 10,),
                                    Text('+917527910117', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20))

                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),




                SizedBox(height:30),
                TextField(
                  onChanged: (value){
                    setState(() {
                      textfield = value;

                    });
                  },

                  decoration: InputDecoration(
                      hintText: 'Enter Coupon'
                  ),

                  // controller: couponController,



                ),
                IconButton(


                    onPressed: (){
                      if(textfield == 'GRAMYATRI'){
                        setState(() {
                          Price = 100;
                        });
                      }
                      else{
                        Price = widget.price;
                      }


                    }
                    , icon: Icon(Icons.local_offer_rounded,))
                ,



                FlatButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    minWidth: 400,
                    child: Text('place order'),

                    onPressed: (){




                      showModalBottomSheet(
                          context: context,
                          builder: (context){
                            return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
                              return Card(



                                child: ListView(

                                  children: [

                                    ChangeColor(

                                        listTile: ListTile(

                                          title: Text('Pay at Site',style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: Colors.white),),


                                          selected: selected1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          minLeadingWidth: MediaQuery.of(context).size.width,
                                          tileColor: Colors.grey.withOpacity(0.8),
                                          onTap: (){

                                            service.createOrder(cart: widget.cartItem,);
                                            setState(() {
                                              selected1 = true;
                                              selected2 = false;
                                              selected3 = false;
                                              Price = 200 ;
                                            });
                                            print(Price);
                                          },
                                        )),
                                    ChangeColor(listTile:ListTile(
                                      tileColor:Colors.grey.withOpacity(0.8),
                                      title: Text('20% Payment Online',style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: Colors.white),),

                                      selected: selected2,
                                      onTap: (){
                                        setState(() {
                                          selected2 = true;
                                          selected1 = false;
                                          selected3 = false;
                                          Price = ( widget.price* twenty).toInt() ;

                                        });

                                      },
                                    )),

                                    ChangeColor(

                                        listTile: ListTile(

                                          tileColor:Colors.grey.withOpacity(0.8),

                                          title: Text('Full Payment Online',style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: Colors.white),),


                                          selected: selected3,
                                          onTap: (){
                                            setState(() {
                                              selected3 = true;
                                              selected1 = false;
                                              selected2 = false;

                                              Price = widget.price ;
                                            });

                                            print(Price);
                                          },
                                        )),

                                    SizedBox(
                                      height: 50,
                                    ),

                                    MaterialButton(onPressed:(){
                                      Navigator.pop(context);

                                      var options = {
                                        'key': 'rzp_live_nMM16kyBQikwGY',
                                        'amount': Price *100,
                                        'name': 'Acme Corp.',
                                        'description': 'Fine T-Shirt',
                                        'prefill': {'contact': '+917527910117', 'email': 'test@razorpay.com'},
                                        'external': {
                                          'wallets': ['paytm']
                                        }
                                      };


                                      try {
                                        _razorpay.open(options);
                                      } catch (e) {
                                        debugPrint('Error: e');
                                      }
                                    } ,
                                      color: Colors.red,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      minWidth: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      child: Text('Pay Now'),
                                    )



                                  ],
                                ),
                              );
                            });
                          }

                      );
                    }
                )




              ],)
        )
    );;
  }
}
