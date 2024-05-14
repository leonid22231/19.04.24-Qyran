import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/video_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';

class TestViewPage extends StatefulWidget {
  final TestEntity test;
  final int index;
  final List<Object> list;
  final String title;
  const TestViewPage({required this.test, required this.index, required this.list, required this.title, super.key});
  @override
  State<StatefulWidget> createState() => _TestViewPageState();
}

class _TestViewPageState extends State<TestViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Object> list = widget.list;
    int global_index = widget.index;
    debugPrint("List size ${list.length} and index ${global_index}");
    return Scaffold(
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
          style: TextStyle(fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.all(widgetPadding),
                    child: Column(
                      children: [],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(widgetPadding),
              child: CustomButton(
                  onPress: list.length == global_index + 1
                      ? () async {
                          String? phone = await StorageController.instance.getPhone();
                          if (!(list[global_index] as TestEntity).view) {
                            api().setView(phone!, null, (list[global_index] as TestEntity).id);
                            (list[global_index] as TestEntity).view = true;
                          }
                          Navigator.pop(context);
                        }
                      : () async {
                          String? phone = await StorageController.instance.getPhone();
                          if (!(list[global_index] as TestEntity).view) {
                            api().setView(phone!, null, (list[global_index] as TestEntity).id);
                            (list[global_index] as TestEntity).view = true;
                          }
                          if ((list[global_index + 1] is VideoEntity)) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerPage(
                                          video: list[global_index + 1] as VideoEntity,
                                          index: global_index + 1,
                                          list: list,
                                          title: widget.title,
                                        )));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestViewPage(
                                          test: list[global_index + 1] as TestEntity,
                                          index: global_index + 1,
                                          list: list,
                                          title: widget.title,
                                        )));
                          }
                        },
                  color: primaryColor,
                  title: list.length == global_index + 1 ? S.of(context).exit : S.of(context).continue_),
            )
          ],
        ),
      ),
    );
  }
}
