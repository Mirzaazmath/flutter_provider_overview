import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/addfavourite_provider.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const  Text("Favourite"),

        ),
        body:
            Consumer<AddToFavouriteProvider>(
                  builder: (context,provider,child) {

                    return ListView.builder(
                        itemCount: provider.selectedItems.length,
                        itemBuilder: (context,index){
                          return Consumer<AddToFavouriteProvider>(
                              builder: (context,provider,child) {

                                return ListTile(
                                  onTap: () {

                                    provider.addtofav(provider.selectedItems[index]);

                                  },
                                  title: Text("Item ${provider.selectedItems[index]} "),
                                  trailing:provider.selectedItems.contains(provider.selectedItems[index])?const Icon(Icons.favorite,color: Colors.red,): const Icon(Icons.favorite_border_outlined),

                                );
                              }
                          );
                        });
                  }


            ));
  }
}
