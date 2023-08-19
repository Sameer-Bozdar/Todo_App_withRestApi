


import 'package:courier_management_system/data/network/baseApiServices.dart';
import 'package:courier_management_system/data/network/networkApiServices.dart';
import 'package:courier_management_system/res/app_url.dart';

class AuthRepository {

  BaseApiServices _apiServices = NetworkApiServices();


  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }


}
