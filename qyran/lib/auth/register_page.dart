import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatefulWidget {
  final String phone;
  const RegisterPage({required this.phone, super.key});
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String phone;
  late String name = "";
  late String surname = "";
  late String email = "";
  late String password = "";
  late String social_1 = "";
  late String social_2 = "";
  @override
  Widget build(BuildContext context) {
    phone = widget.phone;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "+$phone",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(widgetPadding),
            child: SizedBox(
              height: 80.h,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 50.w,
                    width: 50.w,
                  ),
                  Text(
                    S.of(context).register,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: buttonTextSize),
                  ),
                  CustomTextField(
                      hint: "${S.of(context).register_name}*",
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      }),
                  CustomTextField(
                      hint: "${S.of(context).register_surname}*",
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        surname = value;
                        setState(() {});
                      }),
                  CustomTextField(
                      hint: "${S.of(context).register_email}*",
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        email = value;
                        setState(() {});
                      }),
                  CustomTextField(
                      hint: "${S.of(context).register_password}*",
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        password = value;
                        setState(() {});
                      }),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).register_social,
                      style: TextStyle(fontSize: mainSize),
                    ),
                  ),
                  CustomTextField(
                      hint: S.of(context).register_social_,
                      prefix: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset("assets/telegram.svg"),
                      ),
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        social_1 = value;
                        setState(() {});
                      }),
                  CustomTextField(
                      hint: S.of(context).register_social_,
                      prefix: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset("assets/instagram.svg"),
                      ),
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        social_2 = value;
                        setState(() {});
                      }),
                  CustomButton(
                      disableColor: primaryColor.withOpacity(0.24),
                      onPress: !_success()
                          ? null
                          : () {
                              api()
                                  .register(phone, name, surname, email,
                                      password, social_1, social_2)
                                  .then((value) {
                                confirmRegister(phone, value, context);
                              }).onError((error, stackTrace) {
                                if (error is DioException) {
                                  debugPrint("Register error $error");
                                  showError(error.message!).show(context);
                                }
                              });
                            },
                      color: primaryColor,
                      title: S.of(context).continue_),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _success() {
    return (name.isNotEmpty &&
        surname.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty);
  }
}
