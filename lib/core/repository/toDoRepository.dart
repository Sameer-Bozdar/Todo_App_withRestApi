
import 'package:courier_management_system/core/model/TodoModal.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/TodoModal.dart';
import '../res/app_url.dart';
import '../utils/utils.dart';

class TodoRepository {

  BaseApiServices _apiServicesObject = NetworkApiServices();



  Future<TodoModal> fetchToDo() async{

    dynamic response =  _apiServicesObject.getGetApiResponse(AppUrl.getTodoDataUrl).then((value) {
      print('url send to network services');
      Utils.toastMessage('Fetched Data Successfully');
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
    print('Response of Api ======' +response.statusCode);
    return response = TodoModal.fromJson(response);

  }

  Future<void> postToDoData(dynamic data) async {
    dynamic response = await _apiServicesObject.getPostApiResponseWithHeader(
        AppUrl.postTodoDataUrl,
        data, 'application/json');
    if (response.statusCode == 201) {
      Utils.toastMessage('Creation Success');
    } else {
      Utils.toastMessage('Creation Failed');
    }
  }

}









//
// Consumer<HomeviewViewModel>(
// builder: (context, value, _) {
// switch (value.pixabayImages.status) {
// case Status.LOADING:
// return const Center(child: CircularProgressIndicator());
//
// case Status.ERROR:
// return Center(
// child:
// Text(value.pixabayImages.message.toString()));
// case Status.COMPLETED:
// return SizedBox(
// height: 500,
// child: GridView.builder(
// padding: EdgeInsets.zero,
// scrollDirection: Axis.vertical,
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 1,
//
// ),
//
// itemCount:
// value.pixabayImages.data?.hits?.length,
// itemBuilder: (context, index) {
// print(value.pixabayImages.data?.hits);
// // return Text('pakistan');
// return Image.network(
// // value.pixabayImages.data?.hits![index].id == null || value.pixabayImages.data?.hits![index].pageURL == null ? noImage:
// value.pixabayImages.data!.hits![index]
//     .largeImageURL
//     .toString());
// }));
//
// default:
// const Text('');
// }
// return Container();
// },
// ),
//
