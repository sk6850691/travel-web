import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:travel_web/providers/trekkingprovider.dart';
import 'package:travel_web/widgets/CampWidget.dart';

import 'UniqueStays/CampDetails.dart';

class Camps extends StatefulWidget {


  const Camps({Key key}) : super(key: key);

  @override
  _CampsState createState() => _CampsState();
}

class _CampsState extends State<Camps> {

  @override
  Widget build(BuildContext context) {
    final trekkingProvider = Provider.of<TrekingProvider>(context);
    return Scaffold(

      body: ListView(

          
          children:[


               Container(
                 height: 500,
                 width: MediaQuery.of(context).size.width-20,
                 child: Padding(
      padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),





                      child: Image.network(

                        'https://images.unsplash.com/photo-1455763916899-e8b50eca9967?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',fit: BoxFit.fitWidth,),
                    ),
                 ),
               ),
           SizedBox(height: 30,),
           Text('All of our Camps',style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w600),)




          , Container(
             height: 1000,
             width: MediaQuery.of(context).size.width-20,
             child: Scrollbar(
               child:
               Padding(padding: EdgeInsets.only(left: 10,right: 10),
                 child:

               GridView.builder(
                 physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                  ),

                     itemCount: trekkingProvider.camps.length ,
                  itemBuilder:(context,index){
                    return GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CampDetails(campmodel: trekkingProvider.camps[index],)));
                        },

                        child: CampWidget(campModel: trekkingProvider.camps[index],));
                  } ,


                      ),
             ),
           ),

           )]),
      );



  }
}
