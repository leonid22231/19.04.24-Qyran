import 'package:flutter/material.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCheckBox extends StatelessWidget{
  final bool value;
  final Function(bool? value) onChanged;
  final Color? backgroundColor;
  final String? text;
  const CustomCheckBox({this.text,this.backgroundColor,required this.onChanged, required this.value,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            fillColor: value?null:MaterialStateProperty.all<Color>(secondaryColor),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            ),
            side: MaterialStateBorderSide.resolveWith(
                  (states) => value?BorderSide(width: 2.0, color: appGreen):BorderSide(width: 2.0, color: appGray1),
            ),
            checkColor: Colors.white,
            activeColor: backgroundColor??primaryColor,

            value: value,
            onChanged: onChanged
        ),
        text!=null?SizedBox(width: 2.w,):const SizedBox.shrink(),
        text!=null?Text(text!, style: TextStyle(color: appGray3, fontWeight: FontWeight.w400, fontSize: mainSize),):const SizedBox.shrink()
      ],
    );
  }

}