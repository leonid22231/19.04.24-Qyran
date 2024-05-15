import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qyran/api/entity/LessonEntity.dart';
import 'package:qyran/api/entity/TestResultEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/lesson_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_slider.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TestsPage extends StatefulWidget {
  const TestsPage({super.key});
  @override
  State<StatefulWidget> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  ScrollController scrollController = ScrollController();
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSlider(
            wight: 100.w - widgetPadding * 2,
            onSelect: (value) {
              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            },
            children: [
              S.of(context).test_section_1,
              S.of(context).test_section_2
            ]),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
            child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Column(
              children: [
                Flexible(
                    child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.01)],
                      begin: Alignment.topCenter,
                      stops: const [0.9, 1],
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  child: ListView.separated(
                      itemCount: 5,
                      //shrinkWrap: expanded,
                      controller: scrollController,
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 3.h,
                        );
                      },
                      itemBuilder: (context, index) {
                        return _testImageWidget();
                      }),
                )),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  S.of(context).test_current,
                  style: TextStyle(
                      fontSize: buttonTextSize, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Flexible(
                    child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.01)],
                      begin: Alignment.topCenter,
                      stops: const [0.9, 1],
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 3.h,
                        );
                      },
                      itemBuilder: (context, index) {
                        return _testWidget();
                      }),
                )),
              ],
            ),
            FutureBuilder(
                future: StorageController.instance.getPhone(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder(
                        future: api().findResults(snapshot.data!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<TestResultEntity> list = snapshot.data!;
                            if (list.isNotEmpty) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    return _testResultWidget(list[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 3.h,
                                      color: appGray6,
                                    );
                                  },
                                  itemCount: list.length);
                            } else {
                              return Center(
                                child: Text(
                                  S.of(context).test_result_not_found,
                                ),
                              );
                            }
                          } else {
                            return Center(
                              child: Text(
                                S.of(context).test_result_not_found,
                              ),
                            );
                          }
                        });
                  } else {
                    return const SizedBox.shrink();
                  }
                })
          ],
        )),
      ],
    );
  }

  Widget _testResultWidget(TestResultEntity result) {
    List<String> goodIds = result.goodIds.split(",");
    List<String> badIds = result.badIds.split(",");
    List<int> _goodIds = [];
    List<int> _badIds = [];
    goodIds.map((e) {
      if (e.isNotEmpty) {
        _goodIds.add(int.parse(e));
      }
    }).toList();
    badIds.map((e) {
      if (e.isNotEmpty) {
        _badIds.add(int.parse(e));
      }
    }).toList();
    int count = _goodIds.length + _badIds.length;
    debugPrint(
        "Count ${count} and good ${_goodIds.length} ONG and good:${_goodIds.toString()} | bad:${_badIds.toList()}");
    double percent_1 = (100 / count) * _goodIds.length;

    Color color = primaryColor;
    if (percent_1 < 60) {
      color = Colors.redAccent.withOpacity(0.5);
    }
    return InkWell(
      onTap: () async {
        String? phone = await StorageController.instance.getPhone();
        LessonEntity lesson =
            await api().findLessonByTest(phone!, result.test.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LessonViewPage(lesson: lesson)));
      },
      child: Ink(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result.test.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: buttonTextSize,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              result.test.description,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: mainSize),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: Size.fromRadius(30),
                  child: CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 6.0,
                    backgroundColor: Colors.transparent,
                    percent: percent_1 / 100,
                    center: Text(
                      "${_goodIds.length}/$count",
                      style: GoogleFonts.raleway().copyWith(
                          fontSize: mainSize,
                          color: Color(0xff1967D2),
                          fontWeight: FontWeight.w600),
                    ),
                    progressColor: const Color(0xff1967D2),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox.fromSize(
                  size: Size.fromRadius(30),
                  child: CircularPercentIndicator(
                    radius: 30,
                    lineWidth: 6.0,
                    backgroundColor: Colors.transparent,
                    percent: percent_1 / 100,
                    center: Text(
                      "$percent_1%",
                      style: GoogleFonts.raleway().copyWith(
                          fontSize: mainSize,
                          color: color,
                          fontWeight: FontWeight.w600),
                    ),
                    progressColor: color,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _testWidget() {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Тест",
                style:
                    TextStyle(fontSize: mainSize, fontWeight: FontWeight.w600),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: miniSize, color: appGray6),
              ),
              Text(
                getDifference(Duration(minutes: 10)),
                style: TextStyle(fontSize: miniSize, color: appGray2),
              ),
            ],
          )),
          SizedBox(
            width: 2.w,
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }

  Widget _testImageWidget() {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 15.w,
            height: 15.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/lesson_test_image.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Тест",
                style:
                    TextStyle(fontSize: mainSize, fontWeight: FontWeight.w600),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: miniSize, color: appGray6),
              )
            ],
          )),
          SizedBox(
            width: 2.w,
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }
}
