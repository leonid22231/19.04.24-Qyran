import 'package:flutter/widgets.dart';
import 'package:qyran/api/entity/TestResultEntity.dart';
import 'package:qyran/test/QuestionModel.dart';
import 'package:qyran/test/ResponseModel.dart';
import 'package:qyran/test/TestResultModel.dart';

class TestController {
  late TestResultModel? result;
  bool initilize = false;
  static final instance = TestController();
  void init(int id, List<QuestionModel> list) {
    if (!initilize) {
      List<TestResultAnswerModel> results = [];
      for (int i = 0; i < list.length; i++) {
        results.add(TestResultAnswerModel(id: list[i].id, answers: []));
      }
      result = TestResultModel(id: id, results: results);
      initilize = true;
    }
  }

  void saveClassicAnswer(int answer, QuestionModel questionModel) {
    if (initilize) {
      result!.results
          .firstWhere((element) => element.id == questionModel.id)
          .answers
          .add(answer);
      print();
    } else {
      throw const FormatException('TestController is not initilize');
    }
  }

  void saveMultiAnswer(List<int> answers, QuestionModel questionModel) {
    if (initilize) {
      result!.results
          .firstWhere((element) => element.id == questionModel.id)
          .answers = answers;
      print();
    } else {
      throw const FormatException('TestController is not initilize');
    }
  }

  void print() {
    if (initilize) {
      debugPrint("-----------${result!.id}-----------");
      debugPrint("count: ${result!.results.length}---");
      for (int i = 0; i < result!.results.length; i++) {
        debugPrint("-${i + 1}:${result!.results[i].answers.toString()}");
      }
    }
  }

  void clear() {
    result = null;
    initilize = false;
  }
}
