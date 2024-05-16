import 'package:flutter/material.dart';
import 'package:qyran/admin/theme_controller.dart';
import 'package:qyran/test/QuestionModel.dart';
import 'package:qyran/test/TestModel.dart';
import 'package:qyran/test/TrueResponsesModel.dart';
import 'package:qyran/test/TrueTestModel.dart';

class TestEditorController {
  static final instance = TestEditorController();
  late TestModel test;
  late String name;
  late ValueNotifier<int> questionNotify;
  late TrueTestModel trueTest;
  void init() {
    test = TestModel(item: 0, count: 0, questions: []);
    trueTest = TrueTestModel(item: 0, count: 0, responses: []);
    name = "Новый тест";
    questionNotify = ValueNotifier(0);
  }

  void saveTest(String _name, String description) {
    ThemeController.instance.addTest(description, _name, test, trueTest);
    debugPrint("Final test: $_name");
    debugPrint("  Question count ${test.count}");
    for (int i = 0; i < test.count; i++) {
      debugPrint("  Question ${i + 1}: ${test.questions[i].text}");
      debugPrint("  Is multi: ${test.questions[i].multi}");
      debugPrint("  Answers count: ${test.questions[i].responses.length}");
      for (int j = 0; j < test.questions[i].responses.length; j++) {
        debugPrint(
            "   Answer ${j + 1}: ${test.questions[i].responses[j].text}");
      }
      debugPrint("Trues: ${trueTest.responses[i].trues.toList()}");
    }
  }

  void addQuestion(QuestionModel questionModel, TrueResponsesModel trues) {
    test.questions.add(questionModel);
    test.count = test.count + 1;
    trueTest.count = trueTest.count + 1;
    trueTest.responses.add(trues);
    notifyQuest();
  }

  void deleteQuestion(int index) {
    test.questions.removeAt(index);
    test.count = test.count - 1;
    notifyQuest();
  }

  void notifyQuest() {
    questionNotify.value = test.questions.length;
  }

  void dispose() {
    questionNotify.dispose();
  }
}
