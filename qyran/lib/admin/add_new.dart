import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  String? name;
  String? description;
  File? file;
  @override
  Widget build(BuildContext context) {
    return CusstomScaffold(
        title: S.of(context).add_new,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(S.of(context).enter_name),
              CustomTextField(
                  hint: S.of(context).enter_name,
                  onChanged: (value) {
                    name = value;
                  }),
              SizedBox(
                height: 2.h,
              ),
              Text(S.of(context).enter_desc),
              CustomTextField(
                  height: 50.h,
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
              CustomButton(
                color: primaryColor,
                title: S.of(context).crate,
                onPress: () async {
                  if (name != null &&
                      name!.isNotEmpty &&
                      description != null &&
                      description!.isNotEmpty &&
                      file != null) {
                    await api().addNew(name!, description!, file!);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ));
  }
}
