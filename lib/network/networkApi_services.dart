
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:grocery/resource/app_excapations.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'baseApi_services.dart';



class NetworkApiServices extends BaseApiServices{

  @override
  Future getGetApiResponse(String url) async{

    // log("url : $url");
    dynamic responseJson ;
    try {

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data)async {

    dynamic responseJson ;
    try {

      Response response = await post(Uri.parse(url),
          body : data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

 @override
  Future getPutApiResponse(String url, dynamic data)async {

    dynamic responseJson ;
    try {

      Response response = await put(Uri.parse(url),
          body : data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPatchApiResponse(String url) async{

    // log("url : $url");
    dynamic responseJson ;
    try {

      final response = await http.patch(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  dynamic returnResponse (http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error Accrued While communication with server'
            + 'with status code ' + response.statusCode.toString()
        );
    }
  }


}