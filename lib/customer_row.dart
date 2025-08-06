import 'package:flutter/material.dart';
import 'package:shop_management_system/customer_obj.dart';
import 'package:shop_management_system/view_model.dart';

class CustomerRow extends StatelessWidget {
  int index;
  ViewModel viewModel = ViewModel();

  CustomerRow({required this.index});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('حذف الرقم'),
                content: Text('سيتم حذف هذا الرقم نهائياً'),
                actions: [
                  TextButton(
                    child: Text('إلغاء'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Just close dialog
                    },
                  ),
                  ElevatedButton(
                    child: Text('حذف'),
                    onPressed: () {
                      viewModel.removeCustomer(index);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.delete_forever, color: Colors.red, size: 30),
        ),

        Text(
          CustomerObj.customersList[index].pageNumber,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        Spacer(),
        Container(
            width: width * .7,
            child: Text(
              CustomerObj.customersList[index].name,
              maxLines: 5,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.right,
            )),

      ],
    );
  }
}
