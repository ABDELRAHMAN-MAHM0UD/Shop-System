import 'package:flutter/material.dart';
import 'package:shop_management_system/customer_obj.dart';

class CustomerRow extends StatelessWidget {
  int index;
CustomerRow({required this.index});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
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
