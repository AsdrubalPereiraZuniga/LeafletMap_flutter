import 'package:flutter/material.dart';
import 'login_screen.dart ';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'main_map.dart';

void main () {
  runApp ( MaterialApp (
    debugShowCheckedModeBanner: false,
    home: MainMap(),
  ));
}
/*
class MyApp extends StatelessWidget {
  @override
  
  Widget build ( BuildContext context ) {
    return MaterialApp (
      title : 'App Multiscreen ',
      initialRoute : '/',
      routes : {
        '/': ( context ) => LoginScreen () ,
        '/home': ( context ) => HomeScreen () ,
        '/profile': ( context ) => ProfileScreen () ,
      },
    );
  }
}
*/