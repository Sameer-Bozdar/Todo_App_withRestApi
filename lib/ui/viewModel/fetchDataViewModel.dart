
import 'package:courier_management_system/core/model/TodoModal.dart';
import 'package:courier_management_system/core/repository/toDoRepository.dart';
import 'package:flutter/cupertino.dart';
import '../../core/data/response/api_response.dart';
import '../../core/utils/utils.dart';

class FetchDataViewModel with ChangeNotifier{



  FetchDataViewModel(){
  fetchToDoApi();
}

final _myRepo = TodoRepository();

ApiResponse<TodoModal> toDoDataApiResponse = ApiResponse.loading();

setTodoResponse(ApiResponse<TodoModal> response) async {
  toDoDataApiResponse =  response;
  notifyListeners();
}




Future<void> fetchToDoApi()async{
  _myRepo.fetchToDo().then((value) {
    setTodoResponse(ApiResponse.completed(value));
    notifyListeners();
  }).onError((error, stackTrace) {
    setTodoResponse(ApiResponse.error(error.toString()));

  });

}








}



