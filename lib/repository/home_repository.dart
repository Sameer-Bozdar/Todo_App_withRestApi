


import 'package:courier_management_system/model/ImageModel.dart';
import 'package:flutter/cupertino.dart';

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../res/app_url.dart';

class PixaBayImageRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<ImageModel> fetchPixabayImages() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.imgendpoint);
      print(AppUrl.imgendpoint);
      return response = ImageModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }



  Future<dynamic> fetchRandomImage(dynamic data, BuildContext context) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.ranDomImageURL,data);
      print(AppUrl.ranDomImageURL);
      return response = ImageModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }



}