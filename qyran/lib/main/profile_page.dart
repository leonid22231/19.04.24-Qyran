import 'package:flutter/material.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}
class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox.fromSize(
                    size: const Size.fromRadius(50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset("assets/profile_test.png", fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Text("Иван Иванов", style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600),),
                  Text("+79999999999", style: TextStyle(color: appGray6, fontSize: mainSize),)
                ],
              ),
              CustomTextField(
                  hint: "ivanivanov@gmail.com",
                  readOnly: true,
                  onChanged: (value){}
              ),
              CustomTextField(
                  hint: "@ivanov12",
                  readOnly: true,
                  onChanged: (value){}
              ),
              CustomTextField(
                  hint: "@ivanov12",
                  readOnly: true,
                  onChanged: (value){}
              ),
              _itemWidget(S.of(context).profile_item1, () => (){

              }),
              _itemWidget(S.of(context).profile_item2, () => (){

              }),
            ],
          ),
        ),
        const Spacer(),
        CustomButton(
          onPress: (){

          },
            color: primaryColor,
            title: S.of(context).exit
        )
      ],
    );
  }
  Widget _itemWidget(String title, Function() onTap){
    return InkWell(
      onTap: onTap,
      highlightColor: primaryColor.withOpacity(0.3),
      splashColor: primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.maxFinite,
        padding: EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: appGray5, fontWeight: FontWeight.w400, fontSize: mainSize),),
            Icon(Icons.keyboard_arrow_right_outlined, color: appGray5,)
          ],
        ),
      ),
    );
  }
}