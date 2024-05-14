import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/ThemeEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/video_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LessonViewPage extends StatefulWidget {
  final LessonEntity lesson;
  const LessonViewPage({required this.lesson, super.key});

  @override
  State<StatefulWidget> createState() => _LessonViewPageState();
}

class _LessonViewPageState extends State<LessonViewPage> {
  @override
  Widget build(BuildContext context) {
    LessonEntity lesson = widget.lesson;
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
          lesson.course.name,
          style: TextStyle(fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(widgetPadding),
          child: Column(
            children: [
              Column(
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
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      SizedBox.fromSize(
                        size: const Size.fromRadius(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset(
                            "assets/profile_test.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "${lesson.teacher.name} ${lesson.teacher.surname}",
                        style: TextStyle(color: appGray6, fontSize: miniSize),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    height: 3.h,
                  )
                ],
              ),
              FutureBuilder(
                  future: StorageController.instance.getPhone(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder(
                          future: api().findThemes(lesson.id, snapshot.data),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<ThemeEntity> themes = snapshot.data!;
                              context.loaderOverlay.hide();
                              return ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    return _themeWidget(themes[index], index);
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 3.h,
                                    );
                                  },
                                  itemCount: themes.length);
                            } else {
                              context.loaderOverlay.show();
                              return const SizedBox.shrink();
                            }
                          });
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
            ],
          ),
        ),
      ),
    ));
  }

  Widget _themeWidget(ThemeEntity theme, int index) {
    List<Object> objects = [];
    int count = theme.videoList.length + theme.testList.length;
    while (objects.length < count) {
      for (int i = 0; i < theme.videoList.length; i++) {
        if (theme.videoList[i].item == objects.length + 1) {
          objects.add(theme.videoList[i]);
        }
      }
      for (int i = 0; i < theme.testList.length; i++) {
        if (theme.testList[i].item == objects.length + 1) {
          objects.add(theme.testList[i]);
        }
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${index + 1}. ${theme.name}",
          style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              SvgPicture icon = SvgPicture.asset("assets/test_icon.svg");
              String name = "";
              if (objects[index] is VideoEntity) {
                icon = SvgPicture.asset("assets/video_icon.svg");
                name = (objects[index] as VideoEntity).name;
              } else {
                name = (objects[index] as TestEntity).name;
              }
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: (objects[index] is VideoEntity)
                    ? () {
                        videoClick(objects[index] as VideoEntity, objects, index, theme.name);
                      }
                    : () {
                        testClick(objects[index] as TestEntity);
                      },
                child: Ink(
                  padding: EdgeInsets.all(2.w),
                  child: Row(
                    children: [
                      icon,
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(name)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 2.h,
              );
            },
            itemCount: count)
      ],
    );
  }

  void videoClick(VideoEntity video, List<Object> list, int index, String title) {
    debugPrint("Video Click");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoPlayerPage(
                  video: video,
                  list: list,
                  index: index,
                  title: title,
                )));
  }

  void testClick(TestEntity test) {
    debugPrint("Test Click");
  }
}
