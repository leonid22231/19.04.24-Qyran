import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/TestResultEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/controller/TestController.dart';
import 'package:qyran/controller/TestResultController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/test/ResponseModel.dart';
import 'package:qyran/test/TestModel.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuestionViewPage extends StatefulWidget {
  final bool firstOpen;
  final TestModel test;
  final int index;
  final TestEntity testEntity;
  const QuestionViewPage(
      {required this.firstOpen,
      required this.test,
      required this.index,
      required this.testEntity,
      super.key});

  @override
  State<StatefulWidget> createState() => _QuestionViewPageState();
}

class _QuestionViewPageState extends State<QuestionViewPage> {
  late bool firstOpen;
  late TestModel test;
  late int index;
  late TestEntity testEntity;
  late int count;
  late bool multi;
  int? selectedAnswer;
  List<bool>? selectedAnswersMulti;
  @override
  void initState() {
    super.initState();
    if (widget.firstOpen) {
      TestController.instance.init(widget.testEntity.id, widget.test.questions);
    }
    if (widget.test.questions[widget.index].multi) {
      selectedAnswersMulti = widget.test.questions[widget.index].responses
          .map((e) => false)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    firstOpen = widget.firstOpen;
    test = widget.test;
    index = widget.index;
    testEntity = widget.testEntity;
    count = test.count;
    multi = test.questions[index].multi;
    debugPrint("Is first :$firstOpen");
    return LoaderOverlay(
        child: Scaffold(
      appBar: AppBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  TestController.instance.clear();
                  Navigator.pop(context);
                },
                child: Text(
                  S.of(context).back,
                  style: TextStyle(color: primaryColor),
                ))
          ],
        ),
        centerTitle: true,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      splashFactory: NoSplash.splashFactory),
                  onPressed: () {},
                  child: Text(
                    "${index + 1}/$count",
                    style: TextStyle(color: primaryColor),
                  ))
            ],
          )
        ],
        title: Text(
          testEntity.name,
          style: TextStyle(
              fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Padding(
            padding: EdgeInsets.all(widgetPadding),
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    children: [
                      Text(
                        test.questions[index].text,
                        style: TextStyle(
                            fontSize: buttonTextSize,
                            fontWeight: FontWeight.w500,
                            color: appGray6),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      firstOpen
                          ? _answerBuilder(test.questions[index].multi,
                              test.questions[index].responses)
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.all(widgetPadding),
                child: CustomButton(
                  onPress: !(index == count - 1) && firstOpen
                      ? () {
                          bool error = true;
                          if (multi) {
                            if (selectedAnswersMulti!.firstWhere(
                                (element) => element == true,
                                orElse: () => false)) {
                              error = false;
                              List<int> trues = [];
                              for (int i = 0;
                                  i < selectedAnswersMulti!.length;
                                  i++) {
                                if (selectedAnswersMulti![i]) {
                                  trues.add(i);
                                }
                              }
                              TestController.instance.saveMultiAnswer(
                                  trues, test.questions[index]);
                            }
                          } else {
                            if (selectedAnswer != null) {
                              error = false;
                              TestController.instance.saveClassicAnswer(
                                  selectedAnswer!, test.questions[index]);
                            }
                          }
                          if (!error) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionViewPage(
                                        firstOpen: true,
                                        test: test,
                                        index: index + 1,
                                        testEntity: testEntity)));
                          } else {
                            showError(S.of(context).error_test).show(context);
                          }
                        }
                      : firstOpen
                          ? () async {
                              debugPrint("Open in resh");
                              bool error = true;
                              if (multi) {
                                if (selectedAnswersMulti!.firstWhere(
                                    (element) => element == true,
                                    orElse: () => false)) {
                                  error = false;
                                  List<int> trues = [];
                                  for (int i = 0;
                                      i < selectedAnswersMulti!.length;
                                      i++) {
                                    if (selectedAnswersMulti![i]) {
                                      trues.add(i);
                                    }
                                  }
                                  TestController.instance.saveMultiAnswer(
                                      trues, test.questions[index]);
                                }
                              } else {
                                if (selectedAnswer != null) {
                                  error = false;
                                  TestController.instance.saveClassicAnswer(
                                      selectedAnswer!, test.questions[index]);
                                }
                              }
                              if (!error) {
                                context.loaderOverlay.show();
                                String? phone =
                                    await StorageController.instance.getPhone();
                                TestResultEntity result = await api()
                                    .loadTestResult(testEntity.id, phone!,
                                        TestController.instance.result!);
                                context.loaderOverlay.hide();
                                TestController.instance.clear();
                                TestResultController
                                    .instance.tets_result.value = result;
                                Navigator.pop(context);
                              } else {
                                showError(S.of(context).error_test)
                                    .show(context);
                              }
                            }
                          : () {
                              debugPrint("Open in view");
                              Navigator.pop(context);
                            },
                  title: !(index == count - 1) && firstOpen
                      ? S.of(context).next
                      : firstOpen
                          ? S.of(context).end
                          : S.of(context).exit,
                  color: primaryColor,
                ),
              ))
        ],
      ),
    ));
  }

  Widget _answerBuilder(bool multi, List<ResponseModel> list) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        if (multi) {
          return _multiAnswer(list[index]);
        } else {
          return _classicAnswer(list[index]);
        }
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          color: appGray1,
        );
      },
      itemCount: list.length,
    );
  }

  Widget _multiAnswer(ResponseModel answer) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAnswersMulti![answer.id] = !selectedAnswersMulti![answer.id];
        });
      },
      child: Ink(
        padding: EdgeInsets.all(1.w).copyWith(left: 3.w, right: 3.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(answer.text),
            Checkbox(
              value: selectedAnswersMulti![answer.id],
              onChanged: (value) {
                setState(() {
                  selectedAnswersMulti![answer.id] =
                      !selectedAnswersMulti![answer.id];
                });
              },
              checkColor: Colors.white,
              fillColor: selectedAnswersMulti![answer.id]
                  ? MaterialStateColor.resolveWith((states) => primaryColor)
                  : null,
            )
          ],
        ),
      ),
    );
  }

  Widget _classicAnswer(ResponseModel answer) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAnswer = answer.id;
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        padding: EdgeInsets.all(1.w).copyWith(left: 3.w, right: 3.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer.text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: appGray6,
                  fontSize: buttonTextSize),
            ),
            Radio<int>(
              activeColor: primaryColor,
              value: answer.id,
              groupValue: selectedAnswer,
              onChanged: (value) {
                setState(() {
                  selectedAnswer = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
