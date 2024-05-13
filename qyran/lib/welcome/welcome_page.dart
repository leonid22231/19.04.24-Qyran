import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qyran/auth/login_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_welcome.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../generated/l10n.dart';

class WelcomePage extends StatefulWidget{
  const WelcomePage({super.key});
  @override
  State<StatefulWidget> createState() => _WelcomePageState();

}
class _WelcomePageState extends State<WelcomePage>{
  int page = 0;
  List<String> images = [
    "assets/welcome_1.png",
    "assets/welcome_2.png",
    "assets/welcome_3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Flexible(fit: FlexFit.tight,child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: Image.asset(images[page], width: 50.w,),
                  ),
                  CustomWelcome(
                    active: page,
                    count: 3,
                    width: 20.w,
                    height: 3.h,
                  )
                ],
              )),
              Flexible(fit: FlexFit.tight,child: Padding(padding: EdgeInsets.all(2.h),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_titleText(page), style: TextStyle(fontSize: welcomeTitleSize, fontWeight: FontWeight.w700),),
                      Text(_contextText(page), style: TextStyle(fontSize: mainSize,color: textContext),),
                      SizedBox(),
                      SizedBox(),
                      Row(
                        children: [
                          Flexible(child: CustomButton(border: true,textColor: Colors.black,onPress: (){}, color: Colors.transparent, title: S.of(context).skip)),
                          SizedBox(width: 2.w,),
                          Flexible(child: CustomButton(onPress: (){
                            setState(() {
                              pageNext();
                            });
                          }, color: primaryColor, title: page<2?S.of(context).next:S.of(context).start)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(S.of(context).account, style: TextStyle(fontSize: mainSize),),
                          TextButton(onPressed: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>LoginPage()));
                          }, child: Text(S.of(context).sign_in,style: TextStyle(color: primaryColor, fontSize: mainSize)),)
                        ],
                      )
                    ],
                ),
              ),)),
            ],
          )
      ),
    );
  }
  String _titleText(int page){
    switch(page){
      case 0: return S.of(context).welcome_title_1;
      case 1: return S.of(context).welcome_title_2;
      case 2: return S.of(context).welcome_title_3;
    }
    return "";
  }
  String _contextText(int page){
    switch(page){
      case 0: return S.of(context).welcome_context_1;
      case 1: return S.of(context).welcome_context_2;
      case 2: return S.of(context).welcome_context_3;
    }
    return "";
  }
  void pageNext(){
    if(page<2){
      page++;
    }else{
      page = 0;
    }
  }
}