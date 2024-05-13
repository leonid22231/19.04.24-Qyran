import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:qyran/utils/globals_fun.dart';
import '../generated/l10n.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  String? phoneNumber;
  bool register = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(widgetPadding),
          child: SizedBox(
            height: 80.h,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                Text(register?S.of(context).register:S.of(context).sign_in, style: TextStyle(fontWeight: FontWeight.w700, fontSize: buttonTextSize),),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  hint: S.of(context).login_numberPhone,
                    backgroundColor: Colors.white,
                    onChanged: (value){
                      phoneNumber = value;
                      setState(() {

                      });
                    }
                    ),
                CustomButton(
                  disableColor: primaryColor.withOpacity(0.24),
                    onPress: !_success()?null:(){
                      phoneNumber = convertNumber(phoneNumber!);
                      if(register){
                        continueRegister(phoneNumber!,"1111", context);
                      }else{
                        continueLogin(phoneNumber!,"1111", context);
                      }
                    },
                    color: primaryColor,
                    title: S.of(context).continue_
                ),
                Text(S.of(context).or, style: TextStyle(fontWeight: FontWeight.w400, color: appGray4),),
                CustomButton(
                    disableColor: primaryColor.withOpacity(0.24),
                    onPress: loginWithGoogle,
                    color: Colors.transparent,
                    border: true,
                    textColor: primaryColor,
                    borderColor: primaryColor,
                    icon: SvgPicture.asset("assets/google.svg", width: 5.w,),
                    title: S.of(context).continue_in("Google")
                ),
                CustomButton(
                    disableColor: primaryColor.withOpacity(0.24),
                    color: Colors.transparent,
                    border: true,
                    textColor: primaryColor,
                    borderColor: primaryColor,
                    onPress: loginWithApple,
                    icon: SvgPicture.asset("assets/apple.svg", width: 5.w,),
                    title: S.of(context).continue_in("Apple")
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).not_account, style: TextStyle(fontSize: miniSize),),
                    SizedBox(width: 2.w,),
                    TextButton(
                      style: TextButton.styleFrom(
                          surfaceTintColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      onPressed: (){
                        setState(() {
                          register = !register;
                        });
                      }, child: Text(register?S.of(context).sign_in:S.of(context).register, style: TextStyle(fontSize: miniSize, color: primaryColor),),)
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
bool _success(){
    return (phoneNumber != null && phoneNumber!.isNotEmpty);
}
}