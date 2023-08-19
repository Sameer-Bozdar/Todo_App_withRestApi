



class AppUrl{

  static String? value;
 // Pixabay Url
  static var HomeUrl = 'https://pixabay.com/api?';

  static var imgendpoint = HomeUrl + 'key=38737510-383f5e2a0684fa529240fe58c&q=yellow+flowers&image_type=photo&pretty=true';

  static var ranDomImageURL = HomeUrl + 'key=38737510-383f5e2a0684fa529240fe58c&q=${'value'}';

  static var moviesBaseUrl = 'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/';

  static var moviesListUrl = moviesBaseUrl + 'movies_list';

  // Reqres In Urls
  static var reqresbaseUrl = 'https://reqres.in';

  static var loginEndPoint = reqresbaseUrl + '/api/login';

  static var registerApiEndPoint = reqresbaseUrl + '/api/register';




}

