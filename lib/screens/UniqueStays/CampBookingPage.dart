import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_web/models/campmodel.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:travel_web/providers/userprovider.dart';

import 'CampCartScreen.dart';


class CampBookingPage extends StatefulWidget {

  final String description;
  final int price;
  final CampModel campModel;
  const CampBookingPage({Key key,this.price,this.campModel,this.description}) : super(key: key);

  @override
  _CampBookingPageState createState() => _CampBookingPageState();
}

class _CampBookingPageState extends State<CampBookingPage> {
  int quantity = 0;
  int childrenquantity = 0;
  DateTime _selectedDay;
  int pp = 0;
  int totalpp = 0;
  List<DateTime> picked = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();





  }


  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.description,style: GoogleFonts.lato(color:Colors.black,fontSize: 25,fontWeight: FontWeight.w900),),
        ),
        body: SingleChildScrollView(
            child: Column(
                children:[
                  SizedBox(height: 20,),


                  SizedBox(height: 20,),

                  MaterialButton(onPressed: ()async{

                    setState(() {
                      picked.clear();

                    });
                    picked = await  DateRangePicker.showDatePicker(context: context,
                        initialFirstDate: new DateTime.now(),
                        initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                        firstDate: new DateTime(2015),
                        lastDate: new DateTime(DateTime.now().year + 2));



                    print(picked[0]);
                    print(picked[1]);
                  },


                    color: Colors.red,
                    child: Text('select Date'),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),),
                  Container(

                    height: 220,
                    width: MediaQuery.of(context).size.width,


                    child:

                    Card(
                      child: Column(
                        children: [
                          Row(children: [

                            Text('Camp 1',style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 20),), SizedBox(width: 210,),IconButton(icon: Icon(Icons.delete),color: Colors.red,)
                          ],),
                          Divider(
                            thickness: 3,

                          ),
                          SizedBox(
                            height: 10,

                          ),

                          Row(children: [ Text('Adults',style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 20),),SizedBox(width: 218,),IconButton(color:Colors.red,icon: Icon(Icons.remove_circle_outlined),onPressed: (){ if(quantity>0){
                            setState(() {
                              quantity = quantity-1;
                              totalpp= widget.price*quantity;
                            });
                          }},),Text(quantity.toString()),IconButton(onPressed: (){
                            setState(() {
                              quantity = quantity+1;
                              totalpp = widget.price*quantity;
                            });

                          }, icon: Icon(Icons.add_box_rounded),color: Colors.red,)],),

                          SizedBox(height: 30,

                          ),
                          Row(children: [ Text('Children',style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 20),),SizedBox(width: 200,),IconButton(icon: Icon(Icons.remove_circle_outlined),color: Colors.red,onPressed: (){

                            if(childrenquantity>0){
                              setState(() {
                                childrenquantity = childrenquantity-1;
                                totalpp= totalpp+widget.price*childrenquantity;
                              });
                            }
                          },),Text(childrenquantity.toString()),IconButton(onPressed: (){
                            setState(() {
                              childrenquantity = childrenquantity+1;
                              var  tmp = totalpp+widget.price*childrenquantity ;
                              totalpp = tmp /100 as int;
                            });

                          }, icon: Icon(Icons.add_box_rounded),color: Colors.red,)],)
                        ],
                      ),
                    )

                    /* TableCalendar(

                    firstDay: DateTime.utc(2021,01,01),
                    lastDay: DateTime.utc(2021,12,12),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected:

                        (selectedDay, focusedDay) {

                      setState(() {
                        if(selectedDay.day >= DateTime.now().day){
                          _selectedDay = selectedDay;
                        }
                       else return null;
                        // update `_focusedDay` here as well
                      });
                    },
                  ),*/,),

                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(height: 50,),

                  Column(
                    children: [
                      ListTile(title:Text('Price',style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),subtitle: Text('Total pricing excluding discounts'),),
                      ListTile(title:Text('Your savings',style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),subtitle:Text('You will save 6% on this website') ,),
                      ListTile(title: Text('Total',style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600),),subtitle:Text('Inclusives of taxes') ,trailing: Text(totalpp.toString()),)
                    ],
                  ),

                  FlatButton(
                      minWidth: 300,
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child:Text('AddToCart'),
                      onPressed: (){
                       // userProvider.addCampRoCart(campModel: widget.campModel,quantity: quantity.toString());
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CampCartScreen(cartItem:userProvider.cartitem,description: widget.description,price: totalpp,guests: quantity.toString(),dates: picked,camp: widget.campModel,displayimage: widget.campModel.images[0],)));
                      }),


                ]))
    );;
  }
}
