


import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../app_exceptions.dart';
import 'baseApiServices.dart';
class NetworkApiServices extends BaseApiServices {



  // fetching  the data
  @override
  Future getGetApiResponse(String url) async {
    var responseJson;
    try {
      dynamic response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }



  // Posting the data
  @override
  Future getPostApiResponseWithHeader(String url, dynamic data) async {
    dynamic responseJson;

    dynamic jsonBody = jsonEncode(data);
    try {
      Response response = await post(Uri.parse(url), body: jsonBody, headers: <String, String>{"Content-Type": "application/json"}
      ).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
      // print('response of data in Network Class ${responseJson.toString()}');
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // deleting the data by id

  Future deleteDataById(String url, String id) async {
    try {
      final response = await http.delete(Uri.parse(url + id));

      if (response.statusCode == 200) {
        // Successful deletion
        print('Data deleted successfully');
      } else if (response.statusCode == 404) {
        // Data not found
        print('Data with ID $id not found');
      } else {
        // Handle other status codes as needed
        print('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future updateDataById(String url, String id, dynamic data)async {

    try{

      String jsonBody = jsonEncode(data);
        final response = await put(Uri.parse(url+id), body: jsonBody, headers: {
          'Content-Type': 'application/json',
        });
        print(jsonBody);

        if (response.statusCode == 200) {
          // Successful deletion
          print('Data updated successfully');
        } else if (response.statusCode == 404) {
          // Data not found
          print('Data with ID $id not found');
        } else {
          // Handle other status codes as needed
          print('Failed to delete data. Status code: ${response.statusCode}');
        }

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }


  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonEncode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedtException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }




}




