import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:qyran/auth/confirm_code.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/main_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void register(){

}
MotionToast error(String error){
  return MotionToast(
      icon:  Icons.warning_amber,
      width: 80.w,
      height: 10.h,
      title:  Text(S.current.error),
      description:  Text(error),
      position:  MotionToastPosition.top,
      primaryColor: errorColor,
  );
}
void continueLogin(String phone,String confirmCode, BuildContext context){
  debugPrint("Login +$phone");
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=> ConfirmCode(confirmCode: confirmCode,phone: phone, register: false))).then((value){
        if(value!=null && value is bool){
          if(value){
            debugPrint("Login code success");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context)=>const MainPage()), (route) => false);
          }else{
            debugPrint("Login code error");
            error("Какая то ошибка").show(context);
          }
        }else{
          debugPrint("Login code cancel");
        }
  });
}
void continueRegister(String phone,String confirmCode, BuildContext context){
  debugPrint("Register +$phone");
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=> ConfirmCode(confirmCode: confirmCode,phone: phone, register: true))).then((value){
    if(value!=null && value is bool){
      if(value){
        debugPrint("Register code success");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>const MainPage()), (route) => false);
      }else{
        debugPrint("Register code error");
        error("Какая то ошибка").show(context);
      }
    }else{
        debugPrint("Register code cancel");
    }
  });
}
void loginWithGoogle(){

}
void loginWithApple(){

}
String getDifference(Duration duration){
  print("Duration sec ${duration.inSeconds}");
  print("Duration min ${duration.inMinutes}");
  print("Duration h ${duration.inHours}");
  if(duration.inSeconds>=60 && duration.inSeconds <= 3600){
    return "${duration.inMinutes} ${S.current.minute_ago}";
  }else if(duration.inMinutes>=60 && duration.inMinutes <= 1440){
    return "${duration.inHours} ${S.current.hour_ago}";
  }else if(duration.inHours>=24){
    return "${duration.inDays} ${S.current.day_ago}";
  }else{
    return "${duration.inSeconds} ${S.current.second_ago}";
  }
}
String convertNumber(String phoneNumber){
  if(phoneNumber[0]=="8"){
    debugPrint("Convert in $phoneNumber");
    phoneNumber = phoneNumber.replaceFirst("8", "7");
  }
  debugPrint("Convert out $phoneNumber");
  return phoneNumber;
}