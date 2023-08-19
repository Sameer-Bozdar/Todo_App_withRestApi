



import 'package:courier_management_system/repository/auth_repository.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:courier_management_system/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';



class AuthViewModel with ChangeNotifier{

   bool _loading = false;
   bool get loading => _loading;

   bool _signUpLoading = false;
   bool get signUpLoading => _signUpLoading;


   setLoading(bool value){
      _loading = value;
      notifyListeners();
   }

   setSignUpLoading(bool value){
      _signUpLoading = value;
      notifyListeners();
   }


   final _myRepo = AuthRepository();

   Future <void> loginApi(dynamic data , BuildContext context)async{
      setLoading(true);
         _myRepo.loginApi(data).then((value) {
            Utils.snackBar('Login Successful', context);
            Navigator.pushNamed(context, RoutesName.home);
            setLoading(false);
            if(kDebugMode) {
               print(value.toString());
            }

         }).onError((error, stackTrace) {
            setLoading(false);
            if(kDebugMode) {
               Utils.snackBar(error.toString(), context);
               print(error.toString());
            }

            // final userPreferences = Provider.of<UserViewModel>(context, listen: false);

            // userPreferences.saveUser(
            //    UserModel(
            //       token: value['token'].toString()
            //    )

         });

         }

   Future <void> signUpApi(dynamic data , BuildContext context)async{
      setSignUpLoading(true);
      Utils.snackBar('SignUp Successfuly', context);
      Navigator.pushNamed(context, RoutesName.login);
      _myRepo.signUpApi(data).then((value) {
         setSignUpLoading(false);
         if(kDebugMode) {
            print(value.toString());
         }

      }).onError((error, stackTrace) {
         setSignUpLoading(false);
         if(kDebugMode) {
            Utils.snackBar(error.toString(), context);
            print(error.toString());
         }

      });

   }





}