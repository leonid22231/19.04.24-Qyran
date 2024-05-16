import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qyran/controller/UserController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddLesson extends StatefulWidget {
  final String id;
  const AddLesson({required this.id, super.key});
  @override
  State<StatefulWidget> createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson> {
  late String name;
  late String description;
  File? file;
  @override
  Widget build(BuildContext context) {
    return CusstomScaffold(
        title: S.of(context).add_lesson,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).enter_name),
            CustomTextField(
                hint: S.of(context).name,
                onChanged: (value) {
                  name = value;
                }),
            SizedBox(
              height: 2.h,
            ),
            Text(S.of(context).enter_desc),
            CustomTextField(
                hint: S.of(context).desc,
                onChanged: (value) {
                  description = value;
                }),
            SizedBox(
              height: 2.h,
            ),
            TextButton(
                onPressed: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  file = File(image!.path);
                  setState(() {});
                },
                child: Text(file == null
                    ? S.of(context).enter_image
                    : S.of(context).edit_photo)),
            Spacer(),
            CustomButton(
              color: primaryColor,
              title: S.of(context).crate,
              onPress: () {
                if (name.isNotEmpty && description.isNotEmpty && file != null) {
                  if (UserController.instance.isReady) {
                    UserController.instance.print();
                    String phone = UserController.instance.phone;
                    if (widget.id == "null") {
                      api()
                          .addCombo(phone, name, description, file!)
                          .then((value) => Navigator.pop(context));
                    } else {
                      api()
                          .addLessonToCourse(
                              phone, widget.id, name, description, file!)
                          .then((value) => Navigator.pop(context));
                    }
                  }
                }
              },
            )
          ],
        ));
  }
}
