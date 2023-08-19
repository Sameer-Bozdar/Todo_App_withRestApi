import 'package:courier_management_system/repository/home_repository.dart';
import 'package:flutter/material.dart';
import '../data/response/api_response.dart';
import '../model/ImageModel.dart';
import 'package:flutter/material.dart';

class HomeviewViewModel with ChangeNotifier {
  HomeviewViewModel() {
    fetchPixabayImagesApi();
  }
  bool _loading = false;
  bool get loading => _loading;

  String value = "";

  setStringValue(dynamic value){
    this.value = value;
  }

  final _myRepo = PixaBayImageRepository();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ApiResponse<ImageModel> pixabayImages = ApiResponse.loading();

  setImagesList(ApiResponse<ImageModel> response) async {
    pixabayImages = await response;
    notifyListeners();
  }

  Future<void> fetchPixabayImagesApi() async {
    setImagesList(ApiResponse.loading());
    print('api hit');
    _myRepo.fetchPixabayImages().then((value) {
      setImagesList(ApiResponse.completed(value));
      // var qoutetype=   value.type;
    }).onError((error, stackTrace) {
      setImagesList(ApiResponse.error(error.toString()));
    });

  }

  Future<dynamic> fetchRandomImageApi(dynamic data, BuildContext context) async {
    print('api hit of Search Api');
    _myRepo.fetchRandomImage(data, context).then((value) {

      print(value);
      setStringValue(data);
      setLoading(true);
      // var qoutetype=   data.;
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}
