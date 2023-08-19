

import 'package:courier_management_system/data/response/api_response.dart';
import 'package:courier_management_system/model/movies_model.dart';
import 'package:courier_management_system/repository/moviesListRespository.dart';
import 'package:flutter/cupertino.dart';

class MoviesViewViewModel  with ChangeNotifier{

final _myRepo = MoviesListRepository();

ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

setMoviesList(ApiResponse<MoviesListModel> response){
  moviesList =response;
  notifyListeners();

}


Future<void>  FetchMoviesListApi()async{
  setMoviesList(ApiResponse.loading());

  _myRepo.FetchMoviesList().then((value){
    setMoviesList(ApiResponse.completed(value));

  }).onError((error, stackTrace) {
    setMoviesList(ApiResponse.error(error.toString()));


  });




}






}