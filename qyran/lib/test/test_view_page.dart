import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/TestResultEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/controller/TestResultController.dart';
import 'package:qyran/controller/ViewLessonController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/video_view_page.dart';
import 'package:qyran/test/TestModel.dart';
import 'package:qyran/test/question_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TestViewPage extends StatefulWidget {
  final TestEntity test;
  final int index;
  final List<Object> list;
  final String title;
  final int themeIndex;
  const TestViewPage(
      {required this.test,
      required this.index,
      required this.list,
      required this.title,
      required this.themeIndex,
      super.key});
  @override
  State<StatefulWidget> createState() => _TestViewPageState();
}

class _TestViewPageState extends State<TestViewPage> {
  List<bool> results = [];
  bool result = false;
  TestResultEntity? testResult;
  int res = 0;
  double percent = 0;
  @override
  void initState() {
    super.initState();
    debugPrint("Init state");
    result = widget.test.result;
    if (result) {
      _updateTestResult(widget.test);
    }
    TestResultController.instance.init(testResult);
    TestResultController.instance.tets_result.addListener(() {
      debugPrint("Change");
      result = true;
      _loadTestResults(TestResultController.instance.tets_result.value!);
    });
  }

  @override
  void dispose() {
    TestResultController.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Object> list = widget.list;
    int global_index = widget.index;
    debugPrint("List size ${list.length} and index ${global_index}");
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
          style: TextStyle(
              fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.all(widgetPadding),
              child: FutureBuilder(
                future: api().findTest(widget.test.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    context.loaderOverlay.hide();
                    TestModel test = snapshot.data!;
                    double height;
                    int countX = 8;
                    int countY = (test.count / 8).round();
                    double minus = 100.w - (2 * widgetPadding);
                    if (test.count > 8) {
                      height = countY * minus / countX;
                    } else {
                      height = minus / countX;
                    }
                    Color color = primaryColor;
                    if (percent < 60) {
                      color = Colors.redAccent.withOpacity(0.5);
                    }
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).count_answers,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: mainSize),
                            ),
                            Text(
                              "${test.count}",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: height,
                              child: GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: test.count,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 8,
                                  crossAxisSpacing: 1.h,
                                  mainAxisSpacing: 1.h,
                                  //mainAxisExtent: 8.w, // here set custom Height You Want
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  QuestionViewPage(
                                                      firstOpen: false,
                                                      test: test,
                                                      index: index,
                                                      testEntity:
                                                          widget.test)));
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          color: _getColor(index),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(color: appGray2)),
                                      child: Center(
                                        child: Text("${index + 1}"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            !result
                                ? CustomButton(
                                    height: 5.h,
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  QuestionViewPage(
                                                    firstOpen: true,
                                                    test: test,
                                                    index: 0,
                                                    testEntity: widget.test,
                                                  )));
                                    },
                                    color: primaryColor,
                                    title: S.of(context).start_test)
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(S.of(context).res,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: mainSize)),
                                              Text("$res/${test.count}")
                                            ],
                                          ),
                                          Container(
                                            width: 0.5.w,
                                            height: 6.h,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            child: const Center(),
                                          ),
                                          SizedBox.fromSize(
                                            size: const Size.fromRadius(30),
                                            child: CircularPercentIndicator(
                                              radius: 30,
                                              lineWidth: 6.0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              percent: percent / 100,
                                              center: Text(
                                                "${(percent * 10).round() / 10}%",
                                                style: GoogleFonts.raleway()
                                                    .copyWith(
                                                        fontSize: mainSize,
                                                        color: color,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              progressColor: color,
                                            ),
                                          )
                                        ],
                                      ),
                                      percent < 70
                                          ? CustomButton(
                                              height: 5.h,
                                              onPress: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            QuestionViewPage(
                                                              firstOpen: true,
                                                              test: test,
                                                              index: 0,
                                                              testEntity:
                                                                  widget.test,
                                                            )));
                                              },
                                              color: primaryColor,
                                              title: S.of(context).retest)
                                          : const SizedBox.shrink()
                                    ],
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              S.of(context).all_learnd,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: mainSize),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  SvgPicture icon =
                                      SvgPicture.asset("assets/test_icon.svg");
                                  String name = "";
                                  bool current = false;
                                  if (list[index] is VideoEntity) {
                                    icon = SvgPicture.asset(
                                        "assets/video_icon.svg");
                                    name = (list[index] as VideoEntity).name;
                                    current =
                                        (list[index] as VideoEntity).item ==
                                            global_index + 1;
                                  } else {
                                    name = (list[index] as TestEntity).name;
                                    current =
                                        (list[index] as TestEntity).item ==
                                            global_index + 1;
                                  }
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(20),
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
                                              valueListenable:
                                                  ViewLessonController
                                                          .instance.all_themes[
                                                      widget.themeIndex][index],
                                              builder: (_, __, ___) {
                                                return ViewLessonController
                                                            .instance
                                                            .all_themes[widget
                                                                    .themeIndex]
                                                                [index]
                                                            .value ||
                                                        current
                                                    ? Icon(
                                                        !current
                                                            ? Icons.done
                                                            : Icons
                                                                .remove_red_eye,
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
                                itemCount: list.length)
                          ],
                        ),
                      ),
                    );
                  } else {
                    context.loaderOverlay.show();
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(widgetPadding),
              child: CustomButton(
                  onPress: list.length == global_index + 1
                      ? () async {
                          String? phone =
                              await StorageController.instance.getPhone();
                          if (!(list[global_index] as TestEntity).view) {
                            await api().setView(phone!, null,
                                (list[global_index] as TestEntity).id);
                            ViewLessonController
                                .instance
                                .all_themes[widget.themeIndex][global_index]
                                .value = true;
                          }
                          Navigator.pop(context);
                        }
                      : () async {
                          if (percent > 70) {
                            String? phone =
                                await StorageController.instance.getPhone();
                            if (!(list[global_index] as TestEntity).view) {
                              await api().setView(phone!, null,
                                  (list[global_index] as TestEntity).id);
                              ViewLessonController
                                  .instance
                                  .all_themes[widget.themeIndex][global_index]
                                  .value = true;
                            }
                            if ((list[global_index + 1] is VideoEntity)) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPlayerPage(
                                            video: list[global_index + 1]
                                                as VideoEntity,
                                            index: global_index + 1,
                                            list: list,
                                            title: widget.title,
                                            themeIndex: widget.themeIndex,
                                          )));
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TestViewPage(
                                            test: list[global_index + 1]
                                                as TestEntity,
                                            index: global_index + 1,
                                            list: list,
                                            title: widget.title,
                                            themeIndex: widget.themeIndex,
                                          )));
                            }
                          } else {
                            showError(S.of(context).error_bad_test)
                                .show(context);
                          }
                        },
                  color: primaryColor,
                  title: list.length == global_index + 1
                      ? S.of(context).exit
                      : S.of(context).continue_),
            )
          ],
        ),
      ),
    ));
  }

  Color _getColor(int index) {
    if (!result) {
      return Colors.white;
    }
    if (results[index]) {
      return Colors.greenAccent.withOpacity(0.5);
    } else {
      return Colors.redAccent.withOpacity(0.5);
    }
  }

  void _updateTestResult(TestEntity test) async {
    String? phone = await StorageController.instance.getPhone();
    api().findTestResult(test.id, phone!).then((value) {
      _loadTestResults(value);
    });
  }

  void _loadTestResults(TestResultEntity testResultEntity) async {
    results = [];
    testResult = testResultEntity;
    List<int> goodIds = [];
    List<String> _goodIds = testResultEntity.goodIds.split(",");
    _goodIds.map((e) {
      if (e.isNotEmpty) {
        goodIds.add(int.parse(e));
      }
    }).toList();
    debugPrint(goodIds.toString());
    List<int> badIds = [];
    List<String> _badIds = testResultEntity.badIds.split(",");
    _badIds.map((e) {
      if (e.isNotEmpty) {
        badIds.add(int.parse(e));
      }
    }).toList();
    debugPrint(badIds.toString());
    for (int i = 0; i < (goodIds.length + badIds.length); i++) {
      results.add(false);
    }
    goodIds
        .map(
          (e) => results[e] = true,
        )
        .toList();
    badIds
        .map(
          (e) => results[e] = false,
        )
        .toList();
    res = testResultEntity.result;
    percent = (100 / results.length) * res;
    setState(() {});
  }
}
