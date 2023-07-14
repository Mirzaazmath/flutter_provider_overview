import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter_provider_overview/data/app_exceptions.dart';
import 'package:flutter_provider_overview/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responsejson;
   try{
     /// here we are using the timeout to set the time for our request
     final response= await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     responsejson= returnResponse(response);

/// SocketException for Internet lost exception
   }on SocketException{
     throw  FetchException("No Internet Connection");
   }
   return responsejson;

  }

  @override
  Future getPostApiResponse(String url, body) async {
    dynamic responsejson;
    try{
      /// here we are using the timeout to set the time for our request
      final response= await post(Uri.parse(url),
        body: body
      ).timeout(const Duration(seconds: 10));
      responsejson= returnResponse(response);

      /// SocketException for Internet lost exception
    }on SocketException{
      throw  FetchException("No Internet Connection");
    }
    return responsejson;

  }
  /// you can add as many as possible Exceptions here

  dynamic returnResponse(Response  response){
    switch(response.statusCode){
      /// if the statusCode ==200 then it Decode response and return the json
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
       throw  BadRequestException("Bad Request");
       default:
        throw  FetchException("Something Went Wrong");

    }
  }

}