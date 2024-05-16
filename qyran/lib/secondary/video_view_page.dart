import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyran/api/entity/TestEntity.dart';
import 'package:qyran/api/entity/VideoEntity.dart';
import 'package:qyran/controller/StorageController.dart';
import 'package:qyran/controller/ViewLessonController.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/test/test_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final VideoEntity video;
  final int index;
  final List<Object> list;
  final String title;
  final int themeIndex;
  const VideoPlayerPage(
      {required this.video,
      required this.index,
      required this.list,
      required this.title,
      required this.themeIndex,
      super.key});
  @override
  State<StatefulWidget> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    String videoId = YoutubePlayer.convertUrlToId(widget.video.url)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          style: TextStyle(
              fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Padding(
                    padding: EdgeInsets.all(widgetPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: const ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent,
                            ),
                            onReady: () {},
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.index + 1}. ${widget.video.name}",
                              style: TextStyle(
                                  fontSize: buttonTextSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${global_index + 1}/${list.length}",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: buttonTextSize),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          S.of(context).all_learnd,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: mainSize),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              SvgPicture icon =
                                  SvgPicture.asset("assets/test_icon.svg");
                              String name = "";
                              bool current = false;
                              if (list[index] is VideoEntity) {
                                icon =
                                    SvgPicture.asset("assets/video_icon.svg");
                                name = (list[index] as VideoEntity).name;
                                current = (list[index] as VideoEntity).item ==
                                    global_index + 1;
                              } else {
                                name = (list[index] as TestEntity).name;
                                current = (list[index] as TestEntity).item ==
                                    global_index + 1;
                              }
                              return InkWell(
                                borderRadius: BorderRadius.circular(20),
                                child: Ink(
                                  padding: EdgeInsets.all(2.w),
                                  child: Row(
                                    children: [
                                      icon,
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(name),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      ValueListenableBuilder(
                                          valueListenable: ViewLessonController
                                                  .instance
                                                  .all_themes[widget.themeIndex]
                                              [index],
                                          builder: (_, __, ___) {
                                            return ViewLessonController
                                                        .instance
                                                        .all_themes[widget
                                                            .themeIndex][index]
                                                        .value ||
                                                    current
                                                ? Icon(
                                                    !current
                                                        ? Icons.done
                                                        : Icons.remove_red_eye,
                                                    color: primaryColor,
                                                    size: 14,
                                                  )
                                                : SizedBox.shrink();
                                          })
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 2.h,
                              );
                            },
                            itemCount: list.length)
                      ],
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
                          String? phone =
                              await StorageController.instance.getPhone();
                          if (!(list[global_index] as VideoEntity).view) {
                            api().setView(phone!,
                                (list[global_index] as VideoEntity).id, null);
                            ViewLessonController
                                .instance
                                .all_themes[widget.themeIndex][global_index]
                                .value = true;
                          }
                          Navigator.pop(context);
                        }
                      : () async {
                          String? phone =
                              await StorageController.instance.getPhone();
                          if (!(list[global_index] as VideoEntity).view) {
                            api().setView(phone!,
                                (list[global_index] as VideoEntity).id, null);
                            ViewLessonController
                                .instance
                                .all_themes[widget.themeIndex][global_index]
                                .value = true;
                          }
                          if ((list[global_index + 1] is VideoEntity)) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerPage(
                                          video: list[global_index + 1]
                                              as VideoEntity,
                                          index: global_index + 1,
                                          list: list,
                                          title: widget.title,
                                          themeIndex: widget.themeIndex,
                                        )));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestViewPage(
                                          test: list[global_index + 1]
                                              as TestEntity,
                                          index: global_index + 1,
                                          list: list,
                                          title: widget.title,
                                          themeIndex: widget.themeIndex,
                                        )));
                          }
                        },
                  color: primaryColor,
                  title: list.length == global_index + 1
                      ? S.of(context).exit
                      : S.of(context).continue_),
            )
          ],
        ),
      ),
    );
  }
}
