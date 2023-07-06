import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Provider Counter"),
      ),
      body: Center(
        /// here we are using the  Consumer widget that comes with provider package
        /// to update only widget that place inside it
        /// here we are assiging  the Consumer to it provider type
        child: Consumer<CounterProvider>(
          builder: (BuildContext context, value, Widget? child) {
            /// we can acess all aspects of CounterProvider by this (value)
            return  Text(value.count.toString(),style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),);
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          ///here we are calling the updatecount method of class CounterProvider and we also set listen to false to prevent any build time error
          Provider.of<CounterProvider>(context,listen: false).updatecount();
        },
      ),
    );
  }
}
