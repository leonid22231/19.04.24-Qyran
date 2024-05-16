import 'package:flutter/material.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCourse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  late String? name;
  @override
  Widget build(BuildContext context) {
    return CusstomScaffold(
        title: S.of(context).add_course,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).enter_name),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              onChanged: (value) {
                name = value;
              },
              hint: S.of(context).name,
            ),
            Spacer(),
            CustomButton(
              color: primaryColor,
              title: S.of(context).crate,
              onPress: () {
                if (name != null && name!.isNotEmpty) {
                  api()
                      .addCourse(name!)
                      .then((value) => Navigator.pop(context));
                }
              },
            )
          ],
        ));
  }
}
