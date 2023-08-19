import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i=0; i<rating.length ; i++ ){
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }



  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus){
      current.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);

  }


  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  // static flushBarErrorMessage(String message, BuildContext context) {
  //   showFlushbar(
  //       context: context,
  //       flushbar: Flushbar(
  //         message: message,
  //         forwardAnimationCurve: Curves.decelerate,
  //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //         padding: EdgeInsets.all(15),
  //         borderRadius: BorderRadius.circular(20),
  //         duration: Duration(seconds: 3),
  //         backgroundColor: Colors.black,
  //         flushbarPosition: FlushbarPosition.TOP,
  //         reverseAnimationCurve: Curves.easeInOut,
  //         positionOffset: 10,
  //         icon: Icon(
  //           Icons.error,
  //           size: 28,
  //           color: Colors.white,
  //         ),
  //       )..show(context));
  // }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
