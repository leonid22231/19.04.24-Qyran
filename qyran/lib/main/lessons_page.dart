import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qyran/api/entity/LessonCurrentModel.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/lesson_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});
  @override
  State<StatefulWidget> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  String? search;
  bool empty = false;
  @override
  Widget build(BuildContext context) {
    return empty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).lessons_empty,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: mainSize),
              ),
              CustomButton(
                  color: primaryColor,
                  onPress: () {
                    NotifyCourse().dispatch(context);
                  },
                  title: S.of(context).bottomBar_item1)
            ],
          )
        : Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: StorageController.instance.getPhone(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder(
                        future: api().findActiveLessons(snapshot.data!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<LessonCurrentModel> list = snapshot.data!;
                            if (list.isNotEmpty) {
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
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).lessons_empty,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: mainSize),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomButton(
                                      color: primaryColor,
                                      onPress: () {
                                        NotifyCourse().dispatch(context);
                                      },
                                      title: S.of(context).bottomBar_item1)
                                ],
                              );
                            }
                          } else {
                            return SizedBox.shrink();
                          }
                        });
                  } else {
                    return SizedBox.shrink();
                  }
                }),
              ))
            ],
          );
  }

  Widget _lessonWidget(LessonCurrentModel lesson) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 20.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/lesson_test_image.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        //title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  lesson.lesson.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: mainSize),
                ),
                SizedBox(
                  width: 2.w,
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right_outlined)
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          lesson.lesson.description,
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
            S.of(context).lesson_from(
                lesson.lesson.teacher.name, lesson.lesson.teacher.surname),
            style: TextStyle(color: appGray6, fontSize: miniSize),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            SizedBox.fromSize(
              size: Size.fromRadius(progressRadius),
              child: CircularPercentIndicator(
                radius: progressRadius,
                lineWidth: 6.0,
                backgroundColor: Colors.transparent,
                percent: lesson.percent / 100,
                center: Text(
                  "${(lesson.percent * 10).round() / 10}%",
                  style: GoogleFonts.raleway().copyWith(
                      fontSize: mainSize,
                      color: primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                progressColor: primaryColor,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
                child: CustomButton(
                    height: Size.fromRadius(progressRadius).height,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LessonViewPage(lesson: lesson.lesson)));
                    },
                    color: primaryColor,
                    title: S.of(context).continue_)),
          ],
        )
      ],
    );
  }
}

class NotifyCourse extends Notification {
  NotifyCourse();
}
