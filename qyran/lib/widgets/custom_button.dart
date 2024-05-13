import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget{
  final String title;
  final double? width;
  final double? height;
  final bool? disable;
  final bool? border;
  final bool? invert;
  final Color color;
  final Color? textColor;
  final Color? disableColor;
  final Color? borderColor;
  final SvgPicture? icon;
  final Function()? onPress;
  const CustomButton({this.borderColor,this.invert,this.icon,this.disableColor,this.onPress,this.border,this.disable,this.height,this.width,this.textColor,required this.color,required this.title,super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??double.maxFinite,
      height: height??7.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: color,
          side: (border==null || !border!)?BorderSide.none:BorderSide(color: borderColor??const Color(0xff868686).withOpacity(0.7)),
          disabledBackgroundColor: disableColor??secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )
        ),
        onPressed: (disable==null || !disable!)?onPress:null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon==null?const SizedBox.shrink():icon!,
            icon==null?const SizedBox.shrink():SizedBox(width: 2.w,),
            Text(title, style: TextStyle(fontSize: buttonTextSize,color: (disable!=null && disable!)?appGray2:textColor??Colors.white, fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }

}