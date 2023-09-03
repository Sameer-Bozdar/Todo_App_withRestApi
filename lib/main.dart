import 'package:courier_management_system/ui/view/splashView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/routes/routes.dart';
import 'core/utils/routes/routes_name.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //
    // ],
    //   child:
      return MaterialApp(
         home: SplashView(),
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // initialRoute: RoutesName.splash,
      // onGenerateRoute: Routes.generateRoute ,
        debugShowCheckedModeBanner: false,


    );
  }
}
