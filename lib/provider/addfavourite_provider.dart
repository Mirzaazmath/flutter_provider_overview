import 'package:flutter/foundation.dart';



class AddToFavouriteProvider extends ChangeNotifier{
  List<int>_selectedItems=[];
  get selectedItems=>_selectedItems;

  void addtofav(int value){
    if(selectedItems.contains(value)){
      selectedItems.remove(value);
    }else{
      selectedItems.add(value);
    }

    notifyListeners();
  }

}