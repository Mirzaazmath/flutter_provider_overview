import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_overview/repositorys/auth_repo.dart';
import 'package:flutter_provider_overview/utills/general_utlis.dart';

class AuthProvider extends ChangeNotifier{

  final _auth=AuthRepo();

  bool _isload=false;
  get  load=>_isload;

  setLoading(bool value){
    _isload=value;
    notifyListeners();
  }



  Future<void>logincall(dynamic data,BuildContext context)async{
    setLoading(true);
    await _auth.loginApi(data).then((value) {
      setLoading(false);
      Utils.toastmessage("Success");

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showflushbarMessage(error.toString(),context);
      debugPrint(error.toString());
    });
  }
}