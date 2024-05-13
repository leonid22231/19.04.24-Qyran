import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_switcher/slide_switcher.dart';

class CustomSlider extends StatefulWidget{
  final double? wight;
  final double? height;
  final List<String> children;
  final int? initialIndex;
  final Function(int index)? onSelect;
  const CustomSlider({this.initialIndex,this.onSelect,this.wight,this.height,required this.children,super.key});
  @override
  State<StatefulWidget> createState() => _CustomSliderState();

}
class _CustomSliderState extends State<CustomSlider>{
  String select = "";
  @override
  Widget build(BuildContext context) {
    if(select.isEmpty){
      select = widget.children.first;
    }
    return SlideSwitcher(
        containerColor: secondaryColor,
        initialIndex: widget.initialIndex??0,
        containerHeight: (widget.height??7.h),
        containerWight: widget.wight??50.w,
        containerBorder: Border.all(color: appGray1),
        containerBorderRadius: 15,
        indents: 2,
        onSelect: (ss){
          select = widget.children[ss];
          setState(() {

          });
          if(widget.onSelect!=null){
            widget.onSelect!.call(ss);
          }
        },
        children: widget.children.map((e) => Text(e, style: TextStyle(fontSize: mainSize, color: select==e?primaryColor:appGray2,fontWeight: FontWeight.w600),),).toList()
    );
  }
}