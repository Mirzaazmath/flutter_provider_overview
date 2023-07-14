import 'package:flutter/material.dart';
import 'package:flutter_provider_overview/screens/home_screen.dart';
import 'package:flutter_provider_overview/screens/login_screen.dart';
import 'package:flutter_provider_overview/utills/routes/routes_name.dart';

class Routes{
  static  MaterialPageRoute generateRoute(RouteSettings settings){
    /// checking the route name and executing the that particular  case
    switch (settings.name){
      /// HomeScreen
      case RoutesNames.home:
        return MaterialPageRoute(builder: (context)=>const HomeScree());
        /// LoginScreen
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context)=>const LoginScreen());
        /// Default Screen
      default:
    }return MaterialPageRoute(builder: (context)=>const LoginScreen());
    }



  }
