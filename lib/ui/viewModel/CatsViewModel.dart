

import 'package:courier_management_system/core/data/response/api_response.dart';
import 'package:courier_management_system/core/model/CatsModal.dart';
import 'package:courier_management_system/core/repository/CatsRepository.dart';
import 'package:flutter/cupertino.dart';

class CatsViewModel extends ChangeNotifier{


  CatsRepository _myRepo = CatsRepository();
  ApiResponse<CatsModel> apiResponse = ApiResponse.loading();

  setApiResponse(ApiResponse<CatsModel> response){
     apiResponse = response ;
    notifyListeners();
  }

  Future fetchCatsApi(dynamic data) async{
    print('${data} in viewmodal');
    var response = await _myRepo.fetchCatsRepo(data).then((value) {
      setApiResponse(ApiResponse.completed(value));
      notifyListeners();
    }).onError((error, stackTrace) {
      setApiResponse(ApiResponse.error(error.toString()));
    });
  }
}