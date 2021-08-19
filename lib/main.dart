import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_web/providers/LocationProvider.dart';
import 'package:travel_web/providers/bikeprovider.dart';
import 'package:travel_web/providers/trekkingprovider.dart';
import 'package:travel_web/screens/Experiences.dart';
import 'package:travel_web/screens/HomeScreen.dart';
import 'package:travel_web/providers/userprovider.dart';
import 'package:travel_web/screens/RegistrationScreen.dart';
import 'package:travel_web/screens/SplashScreen.dart';
import 'package:travel_web/screens/loginScreen.dart';
import 'package:travel_web/screens/scootydetails.dart';
import 'package:travel_web/widgets/TrekingWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider.value(value: TrekingProvider.initialize()),
        ChangeNotifierProvider.value(value: LocationProvider.initialize()),
        ChangeNotifierProvider.value(value:UserProvider.intialize()),
      ChangeNotifierProvider.value(value: BikeProvider.initialize())],child: MyApp(),)
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
      ),
    );
  }
}
class ScreenController extends StatelessWidget {
  const ScreenController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    switch(userProvider.status){
      case Status.Uninitialized:
        return SplashScreen();
      case Status.Authenticating:
      case Status.Unauthenticated:
        return RegistrationScreen();

      case Status.Authenticated:
        return HomeScreen();

      default:LoginScreen();

    }
  }
}


// ignore: must_be_immutable
