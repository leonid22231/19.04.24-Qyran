import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomWelcome extends StatelessWidget{
  final double width;
  final double height;
  final int count;
  final double padding = 4;
  final int? active;
  const CustomWelcome({this.active,required this.count,required this.height, required this.width,super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for(int i = 0; i < count ; i++){
      list.add(
        Container(
          decoration: BoxDecoration(
            color: (active!=null && active==i)?primaryColor:const Color(0xff101010).withOpacity(0.1),
            borderRadius: BorderRadius.circular(50)
          ),
          width: (width/count)-padding,
          height: height/3-padding,
        )
      );
    }
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      ),
    );
  }

}