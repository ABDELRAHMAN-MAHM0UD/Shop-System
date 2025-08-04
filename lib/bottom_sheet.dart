import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shop_management_system/customer_obj.dart';
import 'package:shop_management_system/saling_row.dart';
import 'package:shop_management_system/view_model.dart';

class AddCustomerBottomSheet extends StatefulWidget {
  final BuildContext rootContext;

  AddCustomerBottomSheet({required this.rootContext});

  @override
  State<AddCustomerBottomSheet> createState() => _AddCustomerBottomSheetState();
}

class _AddCustomerBottomSheetState extends State<AddCustomerBottomSheet> {
  TextEditingController nameController = TextEditingController();

  TextEditingController CustomerNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    ViewModel viewModel = ViewModel();

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 4,right: 15,left: 8,top: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اسم العميل",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                ),textAlign: TextAlign.center,
              ),
              Container(
                  height: height * .06,
                  width: width * .57,
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 22,fontWeight: FontWeight.w600) ,
                    textInputAction: TextInputAction.done,
                    clipBehavior: Clip.none,
                    decoration: InputDecoration(fillColor: Color(0xffeeeeee),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    controller:  nameController,

                  )),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 60,right: 15,left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "رقم الصفحة",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                ),textAlign: TextAlign.center,
              ),
              Container(
                  height: height * .06,
                  width: width * .57,
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 22,fontWeight: FontWeight.w600) ,
                    textInputAction: TextInputAction.done,
                    clipBehavior: Clip.none,
                    decoration: InputDecoration(fillColor: Color(0xffeeeeee),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    controller:CustomerNum  ,

                  )),

            ],
          ),
        ),
        ElevatedButton(
            onPressed: (){

          viewModel.addCustomer(CustomerObj(name: nameController.text,
              pageNumber: CustomerNum.text));
          Flushbar(
          //message: ",
            messageColor: Colors.white,
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Colors.green,
            borderRadius: BorderRadius.circular(10),
            margin: EdgeInsets.all(10),
            animationDuration: Duration(milliseconds: 400),
            messageText: Text("تم إضافة رقم العميل",style: TextStyle(color: Colors.white,fontSize: 24),textAlign: TextAlign.center,),
          )..show(context);

        },
            child: Text("إضافة",style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color(0xff0f0c29)
            ),))
      ],
    ) ;
  }
}
