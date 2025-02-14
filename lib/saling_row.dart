import 'package:flutter/material.dart';

class SalingRow extends StatefulWidget {
  String text;
  TextEditingController controller;
  double width;
  SalingRow({required this.text,
    required this.controller, required this.width});

  @override
  State<SalingRow> createState() => _SalingRowState();
}

class _SalingRowState extends State<SalingRow> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Container(
        margin: EdgeInsets.only(bottom: 20,right: 15,left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: height * .06,
                width: widget.width * .5,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                    fontSize: 22,fontWeight: FontWeight.w600) ,
                  textInputAction: TextInputAction.done,
                  clipBehavior: Clip.none,
                  decoration: InputDecoration(fillColor: Color(0xffeeeeee),
                    filled: true,
                      border: OutlineInputBorder(),
                  ),
                  controller:  widget.controller,

                )),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
