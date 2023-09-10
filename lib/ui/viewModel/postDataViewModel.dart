import 'package:courier_management_system/ui/viewModel/fetchDataViewModel.dart';
import 'package:flutter/cupertino.dart';

import '../../core/data/response/api_response.dart';
import '../../core/model/TodoModal.dart';
import '../../core/repository/toDoRepository.dart';
import '../../core/utils/utils.dart';



class PostDataViewModel with ChangeNotifier{




  final _myPostRepo = TodoRepository();

  FetchDataViewModel fetchDataViewModel = FetchDataViewModel();

  ApiResponse<TodoModal> postDataApiResponse = ApiResponse.loading();

  // setPostTodoResponse(ApiResponse<TodoModal> response) async {
  //   postDataApiResponse =  response;
  //   notifyListeners();
  // }




  Future<void> postTodoApi(dynamic data)async{
    print('data send in view model');
// setPostTodoResponse(ApiResponse.completed(data));
    _myPostRepo.postToDoData(data).then((value) {
      Utils.toastMessage('Creation success');
      fetchDataViewModel.fetchToDoApi();
      notifyListeners();
    }).onError((error, stackTrace) {
      // ApiResponse.error(error.toString());
      Utils.toastMessage('Creation failed');
    });
  }

}