import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
/// here we are using the ValueNotifier to avoid boiler plate code
   /// it works same
 final ValueNotifier<int>_counter= ValueNotifier<int>(0);
 /// we assign value 0 at the time of it's initailization
   /// and also we create ValueNotifier of type int because we are creating the counter app with ValueNotifier

  @override
  Widget build(BuildContext context) {
    /// checking how many time we build the ui
    print("Build");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const  Text("Provider with ValueNotifer"),
      ),
      body: Center(
        /// to access the ValueNotifier we need to use ValueListenableBuilder it is same as consumer
        child:ValueListenableBuilder(
          /// here we are defining the ValueNotifier _counter to valueListenable to listen the changes
            valueListenable: _counter,
            /// builder builds the ui is the change occur
            /// context ,value , child
            builder: (context,value,child){
              /// here we can access our counter using
              return Text(value.toString(),style:const  TextStyle(fontWeight: FontWeight.bold,fontSize: 50),);
        }),

      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          /// increasing the counter value
          _counter.value++;
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
