
import 'package:courier_management_system/core/model/TodoModal.dart';
import 'package:courier_management_system/core/repository/toDoRepository.dart';
import 'package:flutter/cupertino.dart';

import '../../core/data/response/api_response.dart';
import '../../core/utils/utils.dart';

class ToDoViewModel with ChangeNotifier{



ToDoViewModel(){
  fetchToDoApi();
}

final _myToDoRepository = TodoRepository();

ApiResponse<TodoModal> toDoDataApiResponse = ApiResponse.loading();

setTodoList(ApiResponse<TodoModal> response) async {
  toDoDataApiResponse =  response;
  notifyListeners();
}




Future<void> fetchToDoApi()async{
  print('now in viewModel');
  _myToDoRepository.fetchToDo().then((value) {

    setTodoList(ApiResponse.completed(value));
    Utils.toastMessage('function executed in ViewModel');
    notifyListeners();
  }).onError((error, stackTrace) {
    setTodoList(ApiResponse.error(error.toString()));
  });

}

  Future<void> postTodoApi(dynamic data)async{
     _myToDoRepository.postToDoData(data).then((value) {
      Utils.toastMessage('Creation success');
    });

  }

}



