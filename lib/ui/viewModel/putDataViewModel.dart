import 'dart:async';

import 'package:courier_management_system/core/data/response/api_response.dart';
import 'package:courier_management_system/core/model/TodoModal.dart';
import 'package:courier_management_system/core/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

import '../../core/repository/toDoRepository.dart';



class PutDataViewModel with ChangeNotifier{


ApiResponse<TodoModal> _putTodoDataResponse = ApiResponse.loading();

final _myRepo = TodoRepository();


setPutDataResponse(ApiResponse<TodoModal> response) async{
  _putTodoDataResponse = response;
  notifyListeners();
}


  Future fetchUpdateApibyId(String id , dynamic data, BuildContext context) async{
    _myRepo.fetchUpdateApi(id,data).then((value) {
      notifyListeners();
      Timer(Duration(seconds: 1),(){
        Navigator.pushNamed(context, RoutesName.todoList);
      });


    }).onError((error, stackTrace) {
      // setPutDataResponse(ApiResponse.error(error.toString()));
      print('error while updating data');
    });

  }


}