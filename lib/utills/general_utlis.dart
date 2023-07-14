
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';


/// this class holds all simple Method that we are going to using in our app
class Utils{


  /// This method is used to show the toast in our Entire app.
  /// you call it from anywhere from your app
  /// also you can customize it
  static toastmessage(String message){
    Fluttertoast.showToast(msg: message);
  }



  /// This method is used to show the Snackbar or Flushbar in our Entire app.
  /// you call it from anywhere from your app
  /// also you can customize it
  static   showflushbarMessage(String message,BuildContext context){
    showFlushbar(context:context , flushbar: Flushbar(
      message: message,
      duration: const Duration(seconds: 2),
    )..show(context));
  }

  static focusFeildChange(BuildContext context,FocusNode currentFocus,FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }


}