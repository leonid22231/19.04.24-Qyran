import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/admin/add_theme.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/ThemeEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/api/entity/enums/UserRole.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/controller/UserController.dart';
import 'package:qyran/controller/ViewLessonController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/video_view_page.dart';
import 'package:qyran/test/test_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
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
      floatingActionButton: UserController.instance.role != UserRole.user
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTheme(
                              lessonId: widget.lesson.id,
                            ))).then((value) => setState(() {}));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
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
          lesson.course != null ? lesson.course!.name : lesson.title,
          style: TextStyle(
              fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
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
                      child: Image.network(
                        lessonImageUrl(lesson.id),
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
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: mainSize),
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
                          child: Image.network(
                            teacherPhotoUrl(lesson.teacher.id),
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
                              ViewLessonController.instance.dispose();
                              context.loaderOverlay.hide();
                              return ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    ThemeEntity? predTheme;
                                    if (index == 0) {
                                      predTheme = null;
                                    } else {
                                      predTheme = themes[index - 1];
                                    }
                                    return _themeWidget(
                                        predTheme, themes[index], index);
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

  @override
  void dispose() {
    ViewLessonController.instance.dispose();
    super.dispose();
  }

  Widget _themeWidget(ThemeEntity? predTheme, ThemeEntity theme, int index) {
    int themeIndex = index;
    ViewLessonController.instance.addTheme();
    bool dost = false;
    if (predTheme == null) {
      dost = true;
    } else {
      bool checkAll = true;
      predTheme.testList.map((e) => checkAll = e.view).toList();
      predTheme.videoList.map((e) => checkAll = e.view).toList();
      dost = checkAll;
    }
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
          style:
              TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.bold),
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
              bool view = false;
              if (objects[index] is VideoEntity) {
                icon = SvgPicture.asset("assets/video_icon.svg");
                name = (objects[index] as VideoEntity).name;
                view = (objects[index] as VideoEntity).view;
              } else {
                name = (objects[index] as TestEntity).name;
                view = (objects[index] as TestEntity).view;
              }
              ViewLessonController.instance.addValue(view, themeIndex);
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: (objects[index] is VideoEntity)
                    ? () {
                        bool check = false;
                        if (index == 0) {
                          check = true;
                        } else {
                          if (objects[index - 1] is VideoEntity) {
                            if ((objects[index - 1] as VideoEntity).view) {
                              check = true;
                            }
                          } else {
                            if ((objects[index - 1] as TestEntity).view) {
                              check = true;
                            }
                          }
                        }
                        if (check && dost) {
                          videoClick(objects[index] as VideoEntity, objects,
                              index, theme.name, themeIndex);
                        } else {
                          showError(S.of(context).lesson_error).show(context);
                        }
                      }
                    : () {
                        bool check = false;
                        if (index == 0) {
                          check = true;
                        } else {
                          if (objects[index - 1] is VideoEntity) {
                            if ((objects[index - 1] as VideoEntity).view) {
                              check = true;
                            }
                          } else {
                            if ((objects[index - 1] as TestEntity).view) {
                              check = true;
                            }
                          }
                        }
                        if (check && dost) {
                          testClick(objects[index] as TestEntity, objects,
                              index, theme.name, themeIndex);
                        } else {
                          showError(S.of(context).lesson_error).show(context);
                        }
                      },
                child: Ink(
                  padding: EdgeInsets.all(2.w),
                  child: Row(
                    children: [
                      icon,
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(name),
                      SizedBox(
                        width: 2.w,
                      ),
                      ValueListenableBuilder(
                          valueListenable: ViewLessonController
                              .instance.all_themes[themeIndex][index],
                          builder: (context, _, __) {
                            return ViewLessonController.instance
                                    .all_themes[themeIndex][index].value
                                ? Icon(
                                    Icons.done,
                                    color: primaryColor,
                                    size: 14,
                                  )
                                : SizedBox.shrink();
                          })
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

  void videoClick(VideoEntity video, List<Object> list, int index, String title,
      int themeIndex) {
    debugPrint("Video Click");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoPlayerPage(
                  video: video,
                  list: list,
                  index: index,
                  title: title,
                  themeIndex: themeIndex,
                )));
  }

  void testClick(TestEntity test, List<Object> list, int index, String title,
      int themeIndex) {
    debugPrint("Test Click");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestViewPage(
                  test: test,
                  list: list,
                  index: index,
                  title: title,
                  themeIndex: themeIndex,
                )));
  }
}
