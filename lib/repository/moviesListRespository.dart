



import 'package:courier_management_system/model/movies_model.dart';

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../res/app_url.dart';

class MoviesListRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<MoviesListModel> FetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.moviesListUrl);
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }




}