import 'dart:ui';

import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/admin/add_test.dart';
import 'package:qyran/admin/add_video.dart';
import 'package:qyran/admin/theme_controller.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/controller/UserController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/test/TestModel.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddTheme extends StatefulWidget {
  final String lessonId;
  const AddTheme({required this.lessonId, super.key});
  @override
  State<StatefulWidget> createState() => _AddThemeState();
}

class _AddThemeState extends State<AddTheme> {
  String? name;
  @override
  void initState() {
    ThemeController.instance.init();
    super.initState();
  }

  @override
  void dispose() {
    ThemeController.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserController.instance.print();
    return LoaderOverlay(
        child: CusstomScaffold(
            title: S.of(context).add_theme,
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
                ValueListenableBuilder(
                    valueListenable: ThemeController.instance.notify,
                    builder: (_, __, ___) {
                      if (__ > 0) {
                        return Text(
                          S.of(context).drag,
                          textAlign: TextAlign.center,
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: ValueListenableBuilder<int>(
                      valueListenable: ThemeController.instance.notify,
                      builder: (_, __, ___) {
                        debugPrint(
                            "Update objects ${ThemeController.instance.objects} size ${__}");
                        return ImplicitlyAnimatedReorderableList(
                          items: ThemeController.instance.objects!,
                          areItemsTheSame: (oldItem, newItem) =>
                              oldItem == newItem,
                          onReorderFinished: (item, from, to, newItems) =>
                              onReorderFinished(newItems),
                          itemBuilder: (context, itemAnimation, item, index) {
                            SvgPicture icon =
                                SvgPicture.asset("assets/test_icon.svg");
                            String name = "";
                            if (item is VideoEntity) {
                              icon = SvgPicture.asset("assets/video_icon.svg");
                              name = item.name;
                            } else if (item is TestModel) {
                              name = ThemeController.instance
                                      .findName(item.item) ??
                                  "";
                            }

                            return Reorderable(
                              key: ValueKey("${item}_$index"),
                              builder: (context, dragAnimation, inDrag) =>
                                  AnimatedBuilder(
                                animation: dragAnimation,
                                builder: (context, child) => Card(
                                  child: SizeFadeTransition(
                                    animation: itemAnimation,
                                    child: Handle(
                                      delay: const Duration(milliseconds: 600),
                                      child: InkWell(
                                          child: Ink(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                  child: Text(
                                                    "${index + 1}.",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                icon,
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                Text(name),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.w,
                                              width: 8.w,
                                              child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {
                                                    ThemeController.instance
                                                        .deleteItem(index);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete)),
                                            )
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
                Text(S.of(context).add_test_and_video),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        width: ((100.w - widgetPadding * 2) - 5.w) / 2,
                        color: Colors.greenAccent.withOpacity(0.5),
                        title: S.of(context).add_video,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddVideo()));
                        }),
                    CustomButton(
                        width: ((100.w - widgetPadding * 2) - 5.w) / 2,
                        color: Colors.greenAccent.withOpacity(0.5),
                        title: S.of(context).add_test,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTest()));
                        }),
                  ],
                ),
                Spacer(),
                CustomButton(
                    onPress: () async {
                      if (name != null && name!.isNotEmpty) {
                        context.loaderOverlay.show();
                        await ThemeController.instance
                            .createTheme(name!, widget.lessonId);
                        context.loaderOverlay.hide();
                        Navigator.pop(context);
                      }
                    },
                    color: primaryColor,
                    title: S.of(context).crate)
              ],
            )));
  }

  onReorderFinished(List<Object> newItems) {
    ThemeController.instance.objects!
      ..clear()
      ..addAll(newItems);
    ThemeController.instance.notify.value =
        ThemeController.instance.objects!.length;
  }
}
