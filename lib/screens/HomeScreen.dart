import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_web/providers/LocationProvider.dart';
import 'package:travel_web/providers/userprovider.dart';
import 'package:travel_web/screens/Experiences.dart';
import 'package:travel_web/screens/RegistrationScreen.dart';
import 'package:travel_web/screens/homescreen1.dart';
import 'package:travel_web/widgets/locationwidget.dart';

import 'Profile.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  int _currentIndex = 0;
  PageController pageController;

  onTap(index){

    setState(() {
      pageController.animateToPage(index, duration: Duration(milliseconds: 10), curve: Curves.bounceOut);
    });

  }







  RoundedLoadingButtonController roundedLoadingButtonController = RoundedLoadingButtonController();

  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(


      body:
        HomeScreen1(),


    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
}
