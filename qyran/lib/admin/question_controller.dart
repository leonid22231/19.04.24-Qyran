import 'package:flutter/material.dart';
import 'package:qyran/admin/test_editor_controller.dart';
import 'package:qyran/controller/TestController.dart';
import 'package:qyran/test/QuestionModel.dart';
import 'package:qyran/test/ResponseModel.dart';
import 'package:qyran/test/TrueResponsesModel.dart';

class QuestionController {
  static final instance = QuestionController();
  late String? text;
  late QuestionModel? question;
  late List<bool>? answer;
  late ValueNotifier<int> notifyAdd;
  void init() {
    text = "";
    question = QuestionModel(id: 0, text: text!, multi: false, responses: []);
    answer = [];
    notifyAdd = ValueNotifier(0);
  }

  void addAnswer(String text) {
    ResponseModel responseModel =
        ResponseModel(id: question!.responses.length, text: text);
    answer!.add(false);
    question!.responses.add(responseModel);
    notif();
  }

  bool checkAnswers() {
    int count = 0;
    for (int i = 0; i < answer!.length; i++) {
      if (answer![i]) {
        count++;
      }
    }
    if (count > 0) {
      return true;
    }
    return false;
  }

  void create(String text) {
    bool multi = false;
    List<int> trues = [];
    int count = 0;
    for (int i = 0; i < answer!.length; i++) {
      if (answer![i]) {
        count++;
        trues.add(i);
      }
    }
    if (count > 1) {
      multi = true;
    }
    question!.multi = multi;
    question!.text = text;
    question!.id = TestEditorController.instance.test.questions.length;
    TrueResponsesModel trueResp =
        TrueResponsesModel(id: question!.id, trues: trues);
    TestEditorController.instance.addQuestion(question!, trueResp);
  }

  void notif() {
    notifyAdd.value = question!.responses.length;
  }

  void dispose() {
    text = null;
    question = null;
    answer = null;
    notifyAdd.dispose();
  }
}
