import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/lesson_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CourseViewPage extends StatefulWidget {
  final String title;
  final String id;
  const CourseViewPage({required this.title, required this.id, super.key});

  @override
  State<StatefulWidget> createState() => _CourseViewPageState();
}

class _CourseViewPageState extends State<CourseViewPage> {
  List<String> course_lessons = ["Интенсив по математике", "Тригонометрия", "Тригонометрия"];
  List<String> course_images = ["lesson_test_image.png", "lesson_test_image1.png", "lesson_test_image2.png"];
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        child: Scaffold(
      appBar: AppBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  S.of(context).back,
                  style: TextStyle(color: primaryColor),
                ))
          ],
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(widgetPadding),
        child: FutureBuilder(
          future: api().findLessons(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<LessonEntity> lessons = snapshot.data!;
              context.loaderOverlay.hide();
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return _lessonWidget(lessons[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 3.h,
                    );
                  },
                  itemCount: lessons.length);
            } else {
              context.loaderOverlay.show();
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    ));
  }

  Widget _lessonWidget(LessonEntity lesson) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LessonViewPage(lesson: lesson)));
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
                S.of(context).lesson_from(lesson.teacher.name, lesson.teacher.surname),
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
}
