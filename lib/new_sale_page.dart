import 'package:flutter/material.dart';
import 'package:shop_management_system/sale.dart';
import 'package:shop_management_system/saling_row.dart';
import 'package:shop_management_system/view_model.dart';

class NewSalePage extends StatefulWidget {
  const NewSalePage({super.key});
  static const String routeName = "New Sale";

  @override
  State<NewSalePage> createState() => _NewSalePageState();
}

class _NewSalePageState extends State<NewSalePage> {
  ViewModel viewModel = ViewModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController wholeSallingPrice = TextEditingController();
  TextEditingController sellingPrice = TextEditingController();
  TextEditingController installment = TextEditingController(text: '35');
  @override
  void initState() {
    viewModel.loadItems();
    // TODO: implement initState
    super.initState();

  }

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
            colors: [Color(0xff0f0c29),
          Color(0xff302b63),
          Color(0xff24243e),],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Text(
                "عملية بيع جديدة",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
              SalingRow(text: "اسم الجهاز", controller: nameController,width: width,),
              SalingRow(text: "سعر الجملة", controller: wholeSallingPrice, width: width,),
              SalingRow(text: "سعر البيع", controller: sellingPrice, width: width),
              SalingRow(text: "% نسبة القسط", controller: installment, width: width*.35),

              SizedBox(height: height*.15,),
              ElevatedButton(onPressed: (){

                viewModel.addItem(Sale(name: nameController.text,
                    wholePrice: int.parse(wholeSallingPrice.text),
                    sellingPrice: int.parse(sellingPrice.text),
                    installment: int.parse(installment.text),
                date: DateTime.now()));
                ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                      duration: Duration(seconds: 3),
                     content: Text("تم إضافة الجهاز بنجاح",
                     style: TextStyle(color: Colors.white,fontSize: 22,
                         fontWeight: FontWeight.w600
                     ),textAlign: TextAlign.center,
                     ))
                );
              },
                  child: Text("إضافة",style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff0f0c29)
                  ),))
            ],
          ),
        ),
      ),
    );
  }
}
