import 'package:flutter/material.dart';

import 'package:flutter_provider_overview/screens/home_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// here we are initializing ChangeNotifierProvider to listen the changes
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
