import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/CourseEntity.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/course_view_page.dart';
import 'package:qyran/secondary/lesson_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});
  @override
  State<StatefulWidget> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  final _mainNavigatorKey = GlobalKey<NavigatorState>();
  List<String> course_images = [
    "lesson_test_image.png",
    "lesson_test_image1.png",
    "lesson_test_image2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        CustomSlider(
            onSelect: (value) {
              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            },
            wight: 100.w - widgetPadding * 2,
            children: [
              S.of(context).course_section_1,
              S.of(context).course_section_2
            ]),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
            child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            FutureBuilder(
                future: StorageController.instance.getPhone(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder(
                        future: api().findAllCourses(snapshot.data),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<CourseEntity> courses = snapshot.data!;
                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  context.loaderOverlay.hide();
                                  return _itemWidget(courses[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 1.h,
                                  );
                                },
                                itemCount: courses.length);
                          } else {
                            context.loaderOverlay.show();
                            return const SizedBox.shrink();
                          }
                        });
                  } else {
                    return SizedBox.shrink();
                  }
                })),
            LoaderOverlay(
                child: FutureBuilder(
                    future: api().findCombos(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        List<LessonEntity> list = snapshot.data!;
                        context.loaderOverlay.hide();
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return _lessonWidget(list[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 4.h,
                              );
                            },
                            itemCount: list.length);
                      } else {
                        context.loaderOverlay.show();
                        return const SizedBox.shrink();
                      }
                    }))),
          ],
        ))
      ],
    );
  }

  Widget _lessonWidget(LessonEntity lesson) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LessonViewPage(lesson: lesson)));
      },
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 20.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/${course_images[0]}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            //title
            Text(
              lesson.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: mainSize),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              lesson.description,
              style: TextStyle(color: appGray6, fontSize: miniSize),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 1.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S
                    .of(context)
                    .lesson_from(lesson.teacher.name, lesson.teacher.surname),
                style: TextStyle(color: appGray6, fontSize: miniSize),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(CourseEntity courseEntity) {
    return InkWell(
      onTap: courseEntity.sub
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseViewPage(
                            title: courseEntity.name,
                            id: courseEntity.id,
                          )));
            }
          : () {
              showError(S.of(context).course_error).show(context);
            },
      highlightColor: primaryColor.withOpacity(0.3),
      splashColor: primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.maxFinite,
        padding: EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  courseEntity.name,
                  style: TextStyle(
                      color: appGray5,
                      fontWeight: FontWeight.w400,
                      fontSize: mainSize),
                ),
                courseEntity.sub
                    ? const SizedBox.shrink()
                    : SizedBox(
                        width: 3.w,
                      ),
                courseEntity.sub
                    ? const SizedBox.shrink()
                    : Icon(
                        Icons.lock,
                        size: 5.w,
                        color: Colors.redAccent,
                      )
              ],
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
