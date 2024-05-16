import 'package:flutter/cupertino.dart';

class ViewLessonController {
  static final instance = ViewLessonController();
  List<List<bool>> themes = [];
  List<List<ValueNotifier<bool>>> all_themes = [];
  void addTheme() {
    themes.add([]);
    all_themes.add([]);
    debugPrint("View Lesson Controller themes: ${themes.length}");
  }

  void addValue(bool value, int index) {
    themes[index].add(value);
    all_themes[index]
        .add(ValueNotifier(themes[index][themes[index].length - 1]));
    debugPrint("View Lesson Controller values: ${themes[index].length}");
  }

  void dispose() {
    themes = [];
    all_themes = [];
  }
}
