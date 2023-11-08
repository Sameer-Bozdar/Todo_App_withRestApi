

import 'package:courier_management_system/core/data/network/baseApiServices.dart';
import 'package:courier_management_system/core/data/network/networkApiServices.dart';
import 'package:courier_management_system/core/model/CatsModal.dart';
import 'package:courier_management_system/core/res/app_url.dart';
import 'package:courier_management_system/core/utils/utils.dart';

class CatsRepository{

  BaseApiServices _apiServices = NetworkApiServices();



  Future<CatsModel> fetchCatsRepo(String data) async{
    print('${data} in repository');
    var response = await _apiServices.getApiResponse(AppUrl.catsBaseUrl, data).then((value) {
      Utils.toastMessage("Creation success");
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });

    return response;
  }


}