import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/UserEntity.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserEntity user = UserEntity(id: "0", phone: "79999999999", name: "Иван", surname: "Иванов", email: "ivanivanov@gmail.com", role: UserRole.user);

  @override
  void initState() {
    super.initState();
    context.loaderOverlay.show();
    initProfile();
  }

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
                      child: Image.asset(
                        "assets/profile_test.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${user.name} ${user.surname}",
                    style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "+${user.phone}",
                    style: TextStyle(color: appGray6, fontSize: mainSize),
                  )
                ],
              ),
              CustomTextField(hint: user.email, readOnly: true, onChanged: (value) {}),
              CustomTextField(
                  prefix: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: SvgPicture.asset("assets/telegram.svg"),
                  ),
                  hint: (user.social_1 == null || user.social_1!.isEmpty) ? "@ivanov12" : user.social_1,
                  readOnly: false,
                  onChanged: (value) {}),
              CustomTextField(
                  prefix: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: SvgPicture.asset("assets/instagram.svg"),
                  ),
                  hint: (user.social_2 == null || user.social_2!.isEmpty) ? "@ivanov12" : user.social_2,
                  readOnly: false,
                  onChanged: (value) {}),
              _itemWidget(S.of(context).profile_item1, () {
                launchUrl(Uri.parse("https://google.com"));
              }),
              _itemWidget(S.of(context).profile_item2, () {
                launchUrl(Uri.parse("https://google.com"));
              }),
            ],
          ),
        ),
        const Spacer(),
        CustomButton(
            onPress: () {
              logout(context);
            },
            color: primaryColor,
            title: S.of(context).exit)
      ],
    );
  }

  Future<void> initProfile() async {
    String? phone = await StorageController.instance.getPhone();
    api().findProfile(phone!).then((value) {
      context.loaderOverlay.hide();
      setState(() {
        if (user.social_1 != null && user.social_1!.isEmpty) {
          user.social_1 = null;
        }
        if (user.social_2 != null && user.social_2!.isEmpty) {
          user.social_2 = null;
        }
        user = value;
      });
    });
  }

  Widget _itemWidget(String title, Function() onTap) {
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
            Text(
              title,
              style: TextStyle(color: appGray5, fontWeight: FontWeight.w400, fontSize: mainSize),
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              color: appGray5,
            )
          ],
        ),
      ),
    );
  }
}
