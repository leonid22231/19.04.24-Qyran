import 'package:flutter/material.dart';
import 'package:qyran/api/entity/TestResultEntity.dart';

class TestResultController {
  static final instance = TestResultController();
  TestResultEntity? result;
  late ValueNotifier<TestResultEntity?> tets_result;
  void init(TestResultEntity? result) {
    tets_result = ValueNotifier(result);
  }

  void dispose() {
    tets_result.dispose();
  }
}
