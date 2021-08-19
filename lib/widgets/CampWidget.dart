import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_web/models/campmodel.dart';
import 'package:travel_web/models/trekkingmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CampWidget extends StatefulWidget {
  final CampModel campModel;
  const CampWidget({Key key,this.campModel}) : super(key: key);

  @override
  _CampWidgetState createState() => _CampWidgetState();
}

class _CampWidgetState extends State<CampWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,

      child: Column(

          children:


          [



            Container(

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.campModel.images[0],cacheHeight: 20,cacheWidth: 20,fit: BoxFit.fitWidth,))
            ),


            Text(widget
                .campModel.description.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal),),
            Text(widget.campModel.price.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal)),
            Text(widget.campModel.location.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal))
          ]),
    );
  }
}
