import 'package:flutter/material.dart';
import 'package:shop_management_system/earnings.dart';
import 'package:shop_management_system/new_sale_page.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});
  static const String routeName = "Init screen";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
              colors: [Color(0xff0f0c29),
                Color(0xff302b63),
                Color(0xff24243e),],
            ),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NewSalePage.routeName);
                  },
                  child: Text(
                    "عملية بيع جديدة",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700,
                    color: Color(0xff302b63)),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Earnings.routeName);
                  },
                  child: Text(
                    "الأرباح",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800,
                    color: Color(0xff302b63)),
                  )),
            ),
          ],
        ));
  }
}
