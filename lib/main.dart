import 'package:courier_management_system/ui/view/splashView.dart';
import 'package:courier_management_system/ui/viewModel/deleteDataViewModel.dart';
import 'package:courier_management_system/ui/viewModel/fetchDataViewModel.dart';
import 'package:courier_management_system/ui/viewModel/postDataViewModel.dart';
import 'package:courier_management_system/ui/viewModel/putDataViewModel.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FetchDataViewModel>(create: (_)=> FetchDataViewModel()),
        ChangeNotifierProvider<DeleteDataViewModel>(create: (_)=> DeleteDataViewModel()),
        ChangeNotifierProvider<PostDataViewModel>(create: (_)=> PostDataViewModel()),
        ChangeNotifierProvider<PutDataViewModel>(create: (_)=> PutDataViewModel()),
    ],
      child:MaterialApp(
         home: SplashView(),
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute ,
        debugShowCheckedModeBanner: false,


    )
    );
  }
}
