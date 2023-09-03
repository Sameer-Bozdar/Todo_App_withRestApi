import 'package:courier_management_system/core/services/splash_services.dart';
import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}



class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    SplashService _splashService = SplashService();
    _splashService.isLogin(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
        Center(
          child: Text('Splash Screen'),
        )
      ],),
    );
  }
}
