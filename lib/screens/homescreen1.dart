import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_web/screens/Experiences.dart';
import 'package:travel_web/screens/scootydetails.dart';
import 'package:travel_web/screens/uniquestays.dart';
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(


          children: [

            SizedBox(
              height: 30,
            ),
            Stack(
              children:[



                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child:
              ClipRRect(
                borderRadius: BorderRadius.circular(20),



                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width-20,
                  child: Image.network(

                      'https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/sonaal-bangera-65KigGod2l0-unsplash%20(1).jpg?alt=media&token=271e9812-8618-47bd-8e3f-249e3fb91f30',fit: BoxFit.fitWidth,),
                )
                ,
              )
              ),

                Padding(
                    padding: EdgeInsets.only(left: 30,top: 100),
                    child: Text('Explore various adventures, HomeStays,Camps..',style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.w500),)),
           ] ),
            SizedBox(
              height: 20,
            ),
            Text('What would you like to do ?',style: GoogleFonts.lato(fontSize: 30,fontStyle: FontStyle.italic),),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal ,
              child: Container(

                child: Row(

                  children: [
                    SizedBox(
                      width: 20,),
                    Container(
                      height: 500,
                      width: 300,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>UniqueStays()));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              child:
                              Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/45410804291_1993248528_b_20190810152300.jpg?alt=media&token=0cc675a6-bd6b-426e-9fc5-d7bbef50f072',height: 400,fit: BoxFit.fitHeight,
                                  loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadingProgress){
                                    if(loadingProgress == null){
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes!=null?loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes:null,
                                      ),
                                    );
                                  }
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 250,left: 30),

                                child: Text('Unique Stays',style: GoogleFonts.lato(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.normal)))],
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 500,
                      width: 300,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Experiences()));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/WhatsApp%20Image%202021-07-25%20at%2011.16.59%20PM.jpeg?alt=media&token=69cb1e3b-6afd-42f4-aba9-3467cbc1cca1',height: 400,fit: BoxFit.fitHeight,
                                  loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadingProgress){
                                    if(loadingProgress == null){
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes!=null?loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes:null,
                                      ),
                                    );
                                  }
                              ),

                              borderRadius: BorderRadius.circular(20),),
                            Padding(
                                padding: EdgeInsets.only(top: 250,left: 30),
                                child: Text('Experiences',style: GoogleFonts.lato(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.normal),)),

                            SizedBox(height: 200,),

                            Divider(color: Colors.white,thickness: .25,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 500,
                      width: 300,
                      child: GestureDetector(
                        onTap:

                            (){  Navigator.push(context,MaterialPageRoute(builder: (context)=>ScootyDetails()));}

                        ,
                        child: Stack(
                          children: [
                            ClipRRect(

                              child: Image.network('https://images.unsplash.com/photo-1542983013-727fa3280ab0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80',height: 400,fit: BoxFit.fitHeight,
                                  loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadingProgress){
                                    if(loadingProgress == null){
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes!=null?loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes:null,
                                      ),
                                    );
                                  }
                              ),
                              borderRadius: BorderRadius.circular(20),),
                            Padding(
                                padding: EdgeInsets.only(top: 250,left: 30),
                                child: Text('Bike Rentals',style: GoogleFonts.lato(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.normal),))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 500,
                      width: 300,
                      child: Stack(
                        children: [
                          ClipRRect(


                            child: Image.network('https://images.unsplash.com/photo-1526772662000-3f88f10405ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',height: 400,fit: BoxFit.fitHeight,
                                loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadingProgress){
                                  if(loadingProgress == null){
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes!=null?loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes:null,
                                    ),
                                  );
                                }
                            )
                            ,borderRadius: BorderRadius.circular(20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 250,left: 30),
                              child: Text('Trekking',style: GoogleFonts.lato(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.normal),))
                        ],
                      ),
                    ),
                    SizedBox(width: 20,)

                  ],
                ),
              ),
            ),


            
          ],
        ),

    );
  }
}
