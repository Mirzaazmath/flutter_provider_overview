import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/slider_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Provider Counter"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// here we are Creating the  Consumer of class SliderProvider to manage its state
        Consumer<SliderProvider>(builder: (builder,provider,child){

          return Slider(value:provider.value, onChanged: (val){
            provider.setslidervalue(val);
          });
        }),
          /// here we are Creating the  Consumer of class SliderProvider to manage its state
          Consumer<SliderProvider>(builder: (builder,provider,child){
            /// we can acesss the  SliderProvider with this provider variable
            return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red.withOpacity(provider.value),

                ),

              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green.withOpacity(provider.value),

                ),

              ),
            ],

            );
          }),
        ],
      )

    );
  }
}
