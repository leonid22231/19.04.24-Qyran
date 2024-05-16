import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qyran/auth/login_page.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/controller/UserController.dart';
import 'package:qyran/main_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/welcome/welcome_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<StatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage("assets/logo.png"),
                width: 50.w,
                height: 50.w,
              ),
              Text(
                "Qyran",
                style: TextStyle(
                    color: Color(0xffB49C61),
                    fontWeight: FontWeight.w700,
                    fontSize: welcomeTitleSize),
              )
            ],
          ),
        ));
  }

  Future<void> initApp() async {
    bool? logIn = await StorageController.instance.getLogIn();
    StatefulWidget whatNext = const MainPage();
    if (logIn) {
      String? phone = await StorageController.instance.getPhone();
      if (phone != null) {
        await UserController.instance.init();
        debugPrint("Login is succesful phone[$phone]");
      } else {
        await StorageController.instance.setLogIn(false);
        whatNext = const LoginPage();
      }
    } else {
      bool? welcome = await StorageController.instance.getWelcome();
      if (welcome) {
        whatNext = const WelcomePage();
      } else {
        whatNext = const LoginPage();
      }
    }
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => whatNext), (route) => false);
  }
}
