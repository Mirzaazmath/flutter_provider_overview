
import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_overview/data/network/base_api_services.dart';
import 'package:flutter_provider_overview/data/network/network_api_services.dart';
import 'package:flutter_provider_overview/res/endponts.dart';
import 'package:http/http.dart';

class AuthRepo{

  BaseApiServices _apiServices= NetworkApiServices();

  Future<void>loginApi(dynamic data) async {
    try{
      final Response =await _apiServices.getPostApiResponse(AppEndPoints.baseurl+AppEndPoints.loginUrl, data);
      return Response;

    }catch(e){
      throw e;
      debugPrint(e.toString());
    }
  }


}