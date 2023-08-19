import 'package:courier_management_system/utils/routes/routes.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:courier_management_system/view_model/auth_view_model.dart';
import 'package:courier_management_system/view_model/home_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthViewModel()),
        // ChangeNotifierProvider(create: (_)=> UserViewModel()),
        ChangeNotifierProvider(create: (_)=> HomeviewViewModel())
    ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute ,
        debugShowCheckedModeBanner: false,
    ),

    );
  }
}
