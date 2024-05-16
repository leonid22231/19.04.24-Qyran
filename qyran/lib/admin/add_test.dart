import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';
import 'package:qyran/admin/add_question.dart';
import 'package:qyran/admin/test_editor_controller.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/test/QuestionModel.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  TextEditingController _controller = TextEditingController();
  String? name;
  String? description;
  @override
  void initState() {
    TestEditorController.instance.init();
    _controller.setText(TestEditorController.instance.name);
    name = TestEditorController.instance.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CusstomScaffold(
        title: S.of(context).add_test,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(S.of(context).enter_name),
              CustomTextField(
                  controller: _controller,
                  hint: S.of(context).enter_name,
                  onChanged: (value) {
                    name = value;
                  }),
              SizedBox(
                height: 1.h,
              ),
              Text(S.of(context).enter_desc),
              CustomTextField(
                  height: 15.h,
                  hint: S.of(context).desc,
                  onChanged: (value) {
                    description = value;
                  }),
              SizedBox(
                height: 2.h,
              ),
              ValueListenableBuilder(
                  valueListenable: TestEditorController.instance.questionNotify,
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
                    valueListenable:
                        TestEditorController.instance.questionNotify,
                    builder: (_, __, ___) {
                      debugPrint(
                          "Update objects ${TestEditorController.instance.test.questions.length} size ${__}");
                      return ImplicitlyAnimatedReorderableList(
                        items: TestEditorController.instance.test.questions,
                        areItemsTheSame: (oldItem, newItem) =>
                            oldItem == newItem,
                        onReorderFinished: (item, from, to, newItems) =>
                            onReorderFinished(newItems),
                        itemBuilder: (context, itemAnimation, item, index) {
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
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Text(
                                                item.text,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.w,
                                            width: 8.w,
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  TestEditorController.instance
                                                      .deleteQuestion(index);
                                                },
                                                icon: const Icon(Icons.delete)),
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
              SizedBox(
                height: 1.h,
              ),
              CustomButton(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddQuestion(
                                  index: TestEditorController
                                      .instance.test.questions.length,
                                )));
                  },
                  color: Colors.greenAccent.withOpacity(0.5),
                  title: S.of(context).add_question),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                  onPress: () {
                    if (name != null &&
                        name!.isNotEmpty &&
                        description != null &&
                        description!.isNotEmpty &&
                        TestEditorController
                            .instance.test.questions.isNotEmpty) {
                      TestEditorController.instance
                          .saveTest(name!, description!);
                      Navigator.pop(context);
                    }
                  },
                  color: primaryColor,
                  title: S.of(context).crate)
            ],
          ),
        ));
  }

  onReorderFinished(List<QuestionModel> newItems) {
    TestEditorController.instance.test.questions
      ..clear()
      ..addAll(newItems);
    TestEditorController.instance.questionNotify.value =
        TestEditorController.instance.test.questions.length;
  }
}
