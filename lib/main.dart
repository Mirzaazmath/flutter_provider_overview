import 'package:flutter/material.dart';
import 'package:flutter_provider_overview/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_overview/utills/routes/routes.dart';
import 'package:flutter_provider_overview/utills/routes/routes_name.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(


      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider())
      ],
      child: const MaterialApp(
        /// here we are initializing our very first route
      initialRoute: RoutesNames.login,
        /// here we are connecting the route class to avoid more code on main.dart
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
