import 'package:courier_management_system/core/data/response/api_response.dart';
import 'package:courier_management_system/ui/viewModel/fetchDataViewModel.dart';
import 'package:flutter/cupertino.dart';

import '../../core/model/TodoModal.dart';
import '../../core/repository/toDoRepository.dart';



class DeleteDataViewModel with ChangeNotifier{

  FetchDataViewModel fetchDataViewModel = FetchDataViewModel();

final _myRepo = TodoRepository();

ApiResponse<TodoModal> _deleteResponse = ApiResponse.loading();

setdeleteResponse(ApiResponse<TodoModal> response)async{
  _deleteResponse = response;
  notifyListeners();
}

  Future<void> fetchdeleteApibyId(String id)async {
  // setdeleteResponse(ApiResponse.completed(this));
  _myRepo.fetchdeleteApi(id).then((value) {
    fetchDataViewModel.fetchToDoApi();
    notifyListeners();

  }).onError((error, stackTrace) {
    setdeleteResponse(ApiResponse.error(error.toString()));
  });

  }




}