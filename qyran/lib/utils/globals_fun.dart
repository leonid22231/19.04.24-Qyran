import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:qyran/auth/confirm_code.dart';
import 'package:qyran/auth/login_page.dart';
import 'package:qyran/auth/register_page.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/main_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void register() {}
MotionToast showError(String error) {
  return MotionToast(
    icon: Icons.warning_amber,
    width: 80.w,
    height: 10.h,
    title: Text(S.current.error),
    description: Text(error),
    position: MotionToastPosition.top,
    primaryColor: errorColor,
  );
}

Future<Null> dioError(Object? error, StackTrace stackTrace, {required BuildContext context}) async {
  if (error is DioException) {
    showError(error.response!.data!).show(context);
  }
}

Future<void> logIN(String phone) async {
  await StorageController.instance.setPhone(phone);
  await StorageController.instance.setLogIn(true);
}

Future<void> logOUT() async {
  await StorageController.instance.removePhone();
  await StorageController.instance.setLogIn(false);
}

void continueLogin(String phone, String confirmCode, BuildContext context) {
  debugPrint("Login +$phone");
  Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmCode(confirmCode: confirmCode, phone: phone, register: false))).then((value) async {
    if (value != null && value is bool) {
      if (value) {
        debugPrint("Login code success");
        await logIN(phone);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
      } else {
        debugPrint("Login code error");
        showError("Какая то ошибка").show(context);
      }
    } else {
      debugPrint("Login code cancel");
    }
  });
}

void logout(BuildContext context) {
  logOUT();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
}

void continueRegister(String phone, BuildContext context) {
  debugPrint("Continue register +$phone");
  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(phone: phone)));
}

void confirmRegister(String phone, String confirmCode, BuildContext context) {
  debugPrint("Confirm register +$phone");
  Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmCode(confirmCode: confirmCode, phone: phone, register: true))).then((value) async {
    if (value != null && value is bool) {
      if (value) {
        debugPrint("Register code success");
        await logIN(phone);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);
      } else {
        debugPrint("Register code error");
        showError("Какая то ошибка").show(context);
      }
    } else {
      debugPrint("Register code cancel");
    }
  });
}

void loginWithGoogle() {}
void loginWithApple() {}
String getDifference(Duration duration) {
  debugPrint("Duration sec ${duration.inSeconds}");
  debugPrint("Duration min ${duration.inMinutes}");
  debugPrint("Duration h ${duration.inHours}");
  if (duration.inSeconds >= 60 && duration.inSeconds <= 3600) {
    return "${duration.inMinutes} ${S.current.minute_ago}";
  } else if (duration.inMinutes >= 60 && duration.inMinutes <= 1440) {
    return "${duration.inHours} ${S.current.hour_ago}";
  } else if (duration.inHours >= 24) {
    return "${duration.inDays} ${S.current.day_ago}";
  } else {
    return "${duration.inSeconds} ${S.current.second_ago}";
  }
}

String convertNumber(String phoneNumber) {
  if (phoneNumber[0] == "8") {
    debugPrint("Convert in $phoneNumber");
    phoneNumber = phoneNumber.replaceFirst("8", "7");
  }
  debugPrint("Convert out $phoneNumber");
  return phoneNumber;
}
