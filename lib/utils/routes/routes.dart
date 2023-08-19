

import 'package:courier_management_system/model/ImageModel.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:courier_management_system/view/home_view.dart';
import 'package:courier_management_system/view/signup_view.dart';
import 'package:courier_management_system/view/splash_view.dart';
import 'package:courier_management_system/view_model/home_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../view/image_view.dart';
import '../../view/login_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeView());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpView());
      case RoutesName.image:
        return MaterialPageRoute(
            builder: (BuildContext context) => ImageView(model: ImageModel(), imageBoxFit: BoxFit.cover,));
      default:
       return MaterialPageRoute(builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }


}