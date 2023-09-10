
import 'package:courier_management_system/core/model/TodoModal.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../res/app_url.dart';
import '../utils/utils.dart';

class TodoRepository {

  BaseApiServices _apiServicesObject = NetworkApiServices();
  TodoModal todoModal = new TodoModal();

  Future fetchToDo() async{

    var response =  _apiServicesObject.getGetApiResponse(AppUrl.getTodoDataUrl);

    return TodoModal.fromJson( await response);

  }

  Future<dynamic> postToDoData(dynamic data) async {
    print('now in respository');

    var response = await _apiServicesObject.getPostApiResponseWithHeader(
        AppUrl.postTodoDataUrl,
        data).then((value) {
          fetchToDo();
    });

    return response;

    }



    Future fetchdeleteApi( String id)async{
    await _apiServicesObject.deleteDataById(AppUrl.deleteTodoDataUrl,id).then((value) {
      Utils.toastMessage('Deleted Sucessfully');
    }).onError((error, stackTrace) {

      Utils.toastMessage('Deleted Failed');
    });
    }


  Future fetchUpdateApi( String id, dynamic data)async{
     _apiServicesObject.updateDataById(AppUrl.deleteTodoDataUrl,id,data).then((value) {

      Utils.toastMessage('Successfully updated');
    }).onError((error, stackTrace) {

      Utils.toastMessage('Updated Failed');
    });
  }
  }










