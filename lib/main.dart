import 'package:flutter/material.dart';
import 'package:shop_management_system/earnings.dart';

import 'init_screen.dart';
import 'new_sale_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: InitScreen.routeName,
    routes: {
      NewSalePage.routeName: (_) => NewSalePage(),
      Earnings.routeName :(_)=> Earnings(),
      InitScreen.routeName : (_)=> InitScreen()
    },
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge:  TextStyle(fontSize: 20,
              fontWeight: FontWeight.w800, color: Colors.white,height: 2),
          titleMedium:  TextStyle(fontSize: 19,
              fontWeight: FontWeight.w400, color: Colors.white,height: 2)
        ),
      ),
    );
  }
}
