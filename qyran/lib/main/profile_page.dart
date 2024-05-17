import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/UserEntity.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/controller/UserController.dart';
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
  UserEntity user = UserController.instance.user;
  final TextEditingController _social_1 = TextEditingController();
  final TextEditingController _social_2 = TextEditingController();
  String? social_1;
  String? social_2;
  File? file;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(bottom: 7.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () async {
                                  HapticFeedback.vibrate();
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    file = File(image.path);
                                    setState(() {});
                                  }
                                },
                                child: Ink(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      SizedBox.fromSize(
                                        size: const Size.fromRadius(50),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                          child: file == null
                                              ? Image.network(
                                                  userPhotoUrl(user.phone),
                                                  fit: BoxFit.fitWidth,
                                                )
                                              : Image.file(
                                                  file!,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  blurRadius: 1.w,
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(-1, 1))
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Icon(
                                          Icons.edit,
                                          color: primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "${user.name} ${user.surname}",
                                style: TextStyle(
                                    fontSize: buttonTextSize,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "+${user.phone}",
                                style: TextStyle(
                                    color: appGray6, fontSize: mainSize),
                              )
                            ],
                          ),
                          CustomTextField(
                              hint: user.email,
                              readOnly: true,
                              onChanged: (value) {}),
                          CustomTextField(
                              controller: _social_1,
                              prefix: Padding(
                                padding: EdgeInsets.all(3.w),
                                child: SvgPicture.asset("assets/telegram.svg"),
                              ),
                              hint: (user.social_1 == null ||
                                      user.social_1!.isEmpty)
                                  ? "@ivanov12"
                                  : "@${user.social_1}",
                              readOnly: false,
                              onChanged: (value) {
                                setState(() {
                                  social_1 = value;
                                });
                              }),
                          CustomTextField(
                              controller: _social_2,
                              prefix: Padding(
                                padding: EdgeInsets.all(3.w),
                                child: SvgPicture.asset("assets/instagram.svg"),
                              ),
                              hint: (user.social_2 == null ||
                                      user.social_2!.isEmpty)
                                  ? "@ivanov12"
                                  : "@${user.social_2}",
                              readOnly: false,
                              onChanged: (value) {
                                setState(() {
                                  social_2 = value;
                                });
                              }),
                          _itemWidget(S.of(context).profile_item1, () {
                            launchUrl(Uri.parse(
                                "https://docs.google.com/document/d/1zSyX23_L_OdER0v5fKqLSY0Kz0fs0_G7/edit"));
                          }),
                          _itemWidget(S.of(context).profile_item2, () {
                            launchUrl(Uri.parse(
                                "https://docs.google.com/document/d/1d_kd1rBWAX22u_rl5yptcVzZFTdVa-sz/edit?usp=sharing&ouid=110169746193702330807&rtpof=true&sd=true"));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        CustomButton(
            onPress: _isEdit()
                ? () {
                    if (_social_1 != null && _social_2 != null) {
                      api()
                          .saveSocial(user.phone, social_1, social_2)
                          .then((value) {
                        updateProfile().then((value) {
                          social_1 = null;
                          social_2 = null;
                          _social_1.clear();
                          _social_2.clear();
                        });
                      });
                    }
                    if (file != null) {
                      api()
                          .changePhoto(user.phone, file!)
                          .then((value) => setState(() {
                                file = null;
                              }));
                    }
                  }
                : () {
                    logout(context);
                  },
            color: _isEdit() ? appGreen : primaryColor,
            title: _isEdit() ? S.of(context).save : S.of(context).exit)
      ],
    ));
  }

  Future<void> updateProfile() async {
    await UserController.instance.init();
    user = UserController.instance.user;
    setState(() {});
  }

  bool _isEdit() {
    return ((social_1 != null && social_1!.isNotEmpty) ||
            (social_2 != null && social_2!.isNotEmpty)) ||
        file != null;
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
              style: TextStyle(
                  color: appGray5,
                  fontWeight: FontWeight.w400,
                  fontSize: mainSize),
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
