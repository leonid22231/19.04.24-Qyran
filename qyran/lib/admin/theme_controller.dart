import 'package:flutter/material.dart';
import 'package:qyran/admin/ThemeParamModel.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/test/SimpleTestModel.dart';
import 'package:qyran/test/TempTestResponse.dart';
import 'package:qyran/test/TestModel.dart';
import 'package:qyran/test/TestResultModel.dart';
import 'package:qyran/test/TrueTestModel.dart';
import 'package:qyran/utils/globals.dart';

class ThemeController {
  static final instance = ThemeController();
  late String name;
  late ThemeParamModel? params;
  late Map<int, String>? testsNames;
  late Map<int, String>? testsDesc;
  late List<Object>? objects;
  late ValueNotifier<int> notify;
  late List<TrueTestModel> trues;
  void init() {
    params = ThemeParamModel(testList: [], videoList: []);
    objects = [];
    testsNames = Map();
    testsDesc = Map();
    trues = [];
    notify = ValueNotifier(objects!.length);
  }

  void addVideo(VideoEntity video) {
    objects!.add(video);
    notifyTheme();
  }

  String? findName(int item) {
    return testsNames![item];
  }

  String? findDesk(int item) {
    return testsDesc![item];
  }

  void addTest(
      String desc, String name, TestModel test, TrueTestModel trueTest) {
    test.item = testsNames!.length;
    trueTest.item = test.item;
    addTrueTest(trueTest);
    testsNames!.addAll({test.item: name});
    testsDesc!.addAll({test.item: desc});
    objects!.add(test);
    notifyTheme();
  }

  void addTrueTest(TrueTestModel truTest) {
    trues.add(truTest);
  }

  void notifyTheme() {
    notify.value = objects!.length;
  }

  Future<void> createTheme(String name, String lessonId) async {
    Map<int, String> names = Map();
    Map<int, String> desks = Map();
    debugPrint("Good list :");
    for (int i = 0; i < objects!.length; i++) {
      Object obj = objects![i];
      if (obj is VideoEntity) {
        obj.item = i + 1;
      } else {
        if (obj is TestModel) {
          String name = findName(obj.item)!;
          String desc = findDesk(obj.item)!;
          for (int j = 0; j < trues.length; j++) {
            if (trues[j].item == obj.item) {
              trues[j].item = i + 1;
            }
          }
          obj.item = i + 1;
          names.addAll({obj.item: name});
          desks.addAll({obj.item: desc});
        }
      }
    }
    testsNames = names;
    testsDesc = desks;
    List<VideoEntity> videoList = [];
    List<TestModel> tempTestModel = [];
    for (int i = 0; i < objects!.length; i++) {
      if (objects![i] is VideoEntity) {
        videoList.add(objects![i] as VideoEntity);
      }
      if (objects![i] is TestModel) {
        tempTestModel.add(objects![i] as TestModel);
      }
    }
    List<SimpleTestModel> testList = tempTestModel
        .map((e) => SimpleTestModel(
            name: findName(e.item) ?? "Тест(ошибка)",
            description: findDesk(e.item) ?? "Описание(ошибка)",
            item: e.item))
        .toList();

    ThemeParamModel paramModel =
        ThemeParamModel(testList: testList, videoList: videoList);
    List<TempTestResponse> temp =
        await api().addThemeToLesson(lessonId, name, paramModel);
    for (int i = 0; i < temp.length; i++) {
      int id = temp[i].id;
      TestModel testModel =
          tempTestModel.firstWhere((element) => element.item == temp[i].item);
      TrueTestModel trueTest =
          trues.firstWhere((element) => element.item == temp[i].item);
      await api().createTest(id, testModel);
      await api().createResponse(id, trueTest);
    }
  }

  void deleteItem(int index) {
    if (objects![index] is TestModel) {
      testsNames!.remove((objects![index] as TestModel).item);
    }
    objects!.removeAt(index);
    notifyTheme();
  }

  void dispose() {
    params = null;
    objects = null;
    testsNames = null;
    name = "";
    notify.dispose();
  }
}
