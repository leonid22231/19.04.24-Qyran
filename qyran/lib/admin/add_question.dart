import 'package:flutter/material.dart';
import 'package:qyran/admin/question_controller.dart';
import 'package:qyran/admin/test_editor_controller.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/cusstom_scaffold.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddQuestion extends StatefulWidget {
  final int index;
  const AddQuestion({required this.index, super.key});
  @override
  State<StatefulWidget> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  late bool edit = false;
  String? text;
  @override
  void initState() {
    if (TestEditorController.instance.test.questions.length > widget.index) {
      edit = true;
    }
    QuestionController.instance.init();
    super.initState();
  }

  @override
  void dispose() {
    QuestionController.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (edit) {
      debugPrint("Edit test");
    } else {
      debugPrint("Create test");
    }
    return CusstomScaffold(
        title: S.of(context).add_question,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(S.of(context).test_text),
              CustomTextField(
                  height: 20.h,
                  hint: S.of(context).test_test_,
                  onChanged: (value) {
                    text = value;
                  }),
              SizedBox(
                height: 2.h,
              ),
              Text(S.of(context).test_answer),
              CustomButton(
                color: Colors.greenAccent.withOpacity(0.5),
                title: S.of(context).test_answer_,
                onPress: () {
                  _showAlertDialog(context);
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              ValueListenableBuilder(
                  valueListenable: QuestionController.instance.notifyAdd,
                  builder: (_, __, ___) {
                    return ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Ink(
                            padding: EdgeInsets.all(3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(QuestionController.instance
                                        .question!.responses[index].text)),
                                Flexible(
                                    fit: FlexFit.loose,
                                    child: Checkbox(
                                      value: QuestionController
                                          .instance.answer![index],
                                      onChanged: (value) {
                                        QuestionController
                                                .instance.answer![index] =
                                            !QuestionController
                                                .instance.answer![index];
                                        setState(() {});
                                      },
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: QuestionController
                          .instance.question!.responses.length,
                    );
                  }),
              ValueListenableBuilder(
                  valueListenable: QuestionController.instance.notifyAdd,
                  builder: (_, __, ___) {
                    if (__ > 1) {
                      return Text(S.of(context).test_true_answers);
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
              CustomButton(
                  onPress: () {
                    if (text != null &&
                        text!.isNotEmpty &&
                        QuestionController.instance.question!.responses.length >
                            1 &&
                        QuestionController.instance.checkAnswers()) {
                      QuestionController.instance.create(text!);
                      Navigator.pop(context);
                    }
                  },
                  color: primaryColor,
                  title: S.of(context).crate)
            ],
          ),
        ));
  }

  void _showAlertDialog(BuildContext context) {
    String? text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).answer),
          content: CustomTextField(
            height: 10.h,
            onChanged: (value) {
              text = value;
            },
          ),
          actions: [
            TextButton(
              child: Text(S.of(context).cansel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(S.of(context).test_answer_),
              onPressed: () {
                if (text != null) {
                  QuestionController.instance.addAnswer(text!);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
