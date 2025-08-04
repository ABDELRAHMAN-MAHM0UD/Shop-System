import 'package:flutter/material.dart';
import 'package:shop_management_system/customer_obj.dart';

import 'bottom_sheet.dart';
import 'customer_row.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});
  static const String routeName = "Customers";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff0f0c29),
                  Color(0xff302b63),
                  Color(0xff24243e),
                ],
              ),
            ),
            child: Column(children: [
              SizedBox(height: height * 0.06),
              Text(
                "العملاء",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 18),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              builder: (context) => AddCustomerBottomSheet(rootContext: context),

                            );


                        },
                        icon: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.white,
                        )),
                          Spacer(),

                    Container(
                        height: height * .06,
                        width: width * .75,
                        child: TextField(
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 22,fontWeight: FontWeight.w600) ,
                          textInputAction: TextInputAction.done,
                          clipBehavior: Clip.none,
                          decoration: InputDecoration(hintText: "بحث" ,
                            hintStyle: TextStyle(color: Colors.black,),
                            fillColor: Color(0xffeeeeee),
                            filled: true,
                            border: OutlineInputBorder(),
                          ),

                        ))


                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomerRow(index: index)
                  );
                },
                itemCount: CustomerObj.customersList.length,
              ))
            ])));
  }
}
