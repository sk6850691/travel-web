import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:travel_web/models/campmodel.dart';

import 'CampBookingPage.dart';

class CampDetails extends StatefulWidget {

  final CampModel campmodel;

  const CampDetails({Key key,this.campmodel}) : super(key: key);

  @override
  _CampDetailsState createState() => _CampDetailsState();
}

class _CampDetailsState extends State<CampDetails> {
  //Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height: 400,
                child: Image.network("https://images.unsplash.com/photo-1455763916899-e8b50eca9967?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",fit: BoxFit.fitHeight,),
              ),


              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(widget
                        .campmodel.description.toString(),style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w900),),

                    Text(widget.campmodel.price.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal)),
                    Text(widget.campmodel.location.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal))

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(

                child: CarouselSlider.builder(

                    itemCount: widget.campmodel.images.length,
                    itemBuilder:(BuildContext,int itemIndex,int pageViewIndex){
                      return SizedBox(
                        width: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(

                              widget.campmodel.images[itemIndex],fit: BoxFit.cover,width: 2000),
                        ),
                      );
                    }, options: CarouselOptions(
                    height: 200
                )),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(MdiIcons.weatherSunny),title:Text('Property Land Size',style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w900),) ,subtitle: Text('Approx 1 acre of land'),
              ),

              ListTile(
                leading: Icon(MdiIcons.parking),title: Text('Parking',style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w900),),subtitle: Text('camp permises'),
              ),
              ListTile(
                leading: Icon(MdiIcons.food),title: Text('Complimentary',style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w900),),subtitle: Text('Meals,5 Adventures & activities',style: GoogleFonts.lato(color: Colors.grey),),
              ),



              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  onTap:
                      (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CampBookingPage(campModel:widget.campmodel,description: widget.campmodel.description,price: widget.campmodel.price,)));
                  },


                  child: Column(
                    children: [Text(widget.campmodel.description.toString(),style: GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.normal),),

                      ListTile(leading: Text('Day Outing with full back pack') ,trailing:Text('Zipping') ,),
                      ListTile(leading: Text('Mud Volley ball'),trailing: Text('Kayaking'),),
                      ListTile(leading: Text('Rafting'),trailing: Text('Sceneray') ,),
                      ListTile(leading: Text(widget.campmodel.price.toString()), trailing: IconButton(icon: Icon(Icons.add),color: Colors.red,iconSize: 30,onPressed: (){},),)

                    ],




                  ),
                ),
              ),

              /* Expanded(
                child: Container(
                  height: 500,
                  width: 300,
                  child: GoogleMap(

                    mapType: MapType.normal,
    onMapCreated: (GoogleMapController controller) {
    _controller.complete(controller);},
                    initialCameraPosition:  CameraPosition(
                      target: LatLng(45.521563, -122.677433),
                      zoom: 4,
                    ),

                  ),
                ),
              ),*/

              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Things to know',style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 25),)),
              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(leading: Icon(Icons.lightbulb), title: Text('Check-in Time'+'-'+ '11:00 AM'),),
                  ListTile(leading: Icon(Icons.lightbulb), title: Text('Check-out Time'+'-'+ '11:00 AM'),),
                  ListTile(leading: Icon(Icons.lightbulb), title: Text('Use dustbins/dumpsters'),),
                  ListTile(leading: Icon(Icons.lightbulb), title: Text('Guests should have valid ID proof \n at the time of check-in'),),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Text('Rs'+widget.campmodel.price.toString(),style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w900),),
                trailing: MaterialButton(
                  minWidth: 100,
                  child: Text('Book Now',style: GoogleFonts.lato(color: Colors.white,fontSize: 20),),
                  onPressed: (){

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CampBookingPage(campModel:widget.campmodel,description: widget.campmodel.description,price: widget.campmodel.price,)));
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              )


            ],


          ),
        ),
      ),


    );
  }
}
