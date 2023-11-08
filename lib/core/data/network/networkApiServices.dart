


import 'dart:convert';
import 'dart:io';
import 'package:courier_management_system/core/model/CatsModal.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'baseApiServices.dart';
class NetworkApiServices extends BaseApiServices {





  // Posting the data
  @override
  Future getApiResponse(String url, String data) async {
    List <CatsModel> catList = [];
var responseJson;
    print('${data} in the network class');

    final headers = {"X-API-KEY" : "/H1rWHk83PHQdRuy1kM+iA==2tSdODS7qOLGW6Z0"};
        dynamic queryParameter = {'name': data,};
        var uri = Uri.parse(url).replace(queryParameters: queryParameter);
    print(uri.toString());
         final response = await http.get(uri,headers: headers
      );
if(response.statusCode == 200){
 var catsListData = jsonDecode(response.body.toString());
 for(Map i in catsListData){
   print('${catList[0].name} +========+++++++++++++++++++');
   catList.add(CatsModel.fromJson(i));
 }
}
print("responseJSon=======================>>>>>>>>>> "+responseJson.toString());
print(catList[0].name);
        return catList;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;

      case 201:
        dynamic responseJson = jsonEncode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedtException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }




}




