

import 'dart:async';

import 'package:courier_management_system/ui/view/CatsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashService{


  void isLogin(BuildContext context){
    Timer(Duration(seconds : 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CatsView()));
    });

  }



}