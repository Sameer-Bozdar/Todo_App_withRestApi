



abstract class BaseApiServices{

  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getGetApiResponseWithHeader(String url);

  Future<dynamic> getPostApiResponse(String url,dynamic data);

  Future<dynamic> getPostApiResponseWithHeader(String url,dynamic data,String  headers);



}