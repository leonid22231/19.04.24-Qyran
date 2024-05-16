import 'package:flutter/material.dart';
import 'package:qyran/admin/theme_controller.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  String? name;
  String? url;
  @override
  Widget build(BuildContext context) {
    return CusstomScaffold(
        title: S.of(context).add_video,
        body: Column(
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
            Text(S.of(context).enter_video_url),
            CustomTextField(
                hint: S.of(context).enter_name,
                onChanged: (value) {
                  url = value;
                }),
            Spacer(),
            CustomButton(
                onPress: () {
                  if (name != null &&
                      name!.isNotEmpty &&
                      url != null &&
                      url!.isNotEmpty) {
                    VideoEntity video = VideoEntity(
                        id: 0, name: name!, url: url!, item: 0, view: false);
                    ThemeController.instance.addVideo(video);
                    Navigator.pop(context);
                  }
                },
                color: primaryColor,
                title: S.of(context).crate)
          ],
        ));
  }
}
