import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final double? width;
  final double? height;
  final bool? search;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final Function(String value) onChanged;
  final Widget? prefix;
  const CustomTextField({this.prefix, this.readOnly, this.inputFormatters, this.keyboardType, required this.onChanged, this.backgroundColor, this.search, this.height, this.width, this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border;
    if (search ?? false) {
      border = OutlineInputBorder(
        borderSide: BorderSide(color: appGray1),
        borderRadius: BorderRadius.circular(50),
      );
    } else {
      border = OutlineInputBorder(
        borderSide: BorderSide(color: appGray1),
        borderRadius: BorderRadius.circular(10),
      );
    }
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 7.h,
      child: TextField(
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        decoration: InputDecoration(filled: true, prefixIcon: prefix, fillColor: backgroundColor ?? secondaryColor, hintText: hint, hintStyle: TextStyle(fontSize: mainSize, color: appGray2), enabledBorder: border, focusedBorder: border),
      ),
    );
  }
}
