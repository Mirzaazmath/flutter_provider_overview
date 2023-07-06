import 'package:flutter/material.dart';
import 'package:flutter_provider_overview/provider/addfavourite_provider.dart';
import 'package:provider/provider.dart';

import 'favorite_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Provider Add To Fav"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavouriteScreen()));

          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body:ListView.builder(
        itemCount:  100,
          itemBuilder: (context,index){
        return Consumer<AddToFavouriteProvider>(
          builder: (context,provider,child) {

            return ListTile(
              onTap: () {

                provider.addtofav(index);

              },
              title: Text("Item $index"),
              trailing:provider.selectedItems.contains(index)?const Icon(Icons.favorite,color: Colors.red,): const Icon(Icons.favorite_border_outlined),

            );
          }
        );
      })

    );
  }
}
