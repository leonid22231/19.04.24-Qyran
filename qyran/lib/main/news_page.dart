import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/api/entity/NewEntity.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        child: SingleChildScrollView(
      child: FutureBuilder(
        future: api().findNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            context.loaderOverlay.hide();
            List<NewEntity> list = snapshot.data!;
            bool compactView = true;
            if (list.length < 4) {
              compactView = false;
            }
            List<NewEntity> compactList = [];
            List<NewEntity> mainView = [];
            if (compactView) {
              for (int i = 0; i < 3; i++) {
                compactList.add(list[i]);
              }
              for (int i = 3; i < list.length; i++) {
                mainView.add(list[i]);
              }
            } else {
              mainView = list;
            }
            return Column(
              children: [
                compactView
                    ? SizedBox(
                        height: 37.h,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            PageView.builder(
                              itemCount: 3,
                              padEnds: false,
                              controller: controller,
                              itemBuilder: (context, index) {
                                return _itemNew(
                                    newImageUrl(compactList[index].id),
                                    compactList[index]);
                              },
                            ),
                            SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: WormEffect(
                                dotHeight: 2.w,
                                dotWidth: 2.w,
                                activeDotColor: primaryColor,
                                dotColor: appGray1,
                                type: WormType.thinUnderground,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                compactView
                    ? SizedBox(
                        height: 2.h,
                      )
                    : SizedBox.shrink(),
                ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return _itemNew(
                          newImageUrl(mainView[index].id), mainView[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 1.h,
                      );
                    },
                    itemCount: mainView.length)
              ],
            );
          } else {
            context.loaderOverlay.show();
            return SizedBox.shrink();
          }
        },
      ),
    ));
  }

  Widget _itemNew(String image, NewEntity entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 25.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              newImageUrl(entity.id),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          entity.title,
          style: TextStyle(fontSize: mainSize, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          entity.description,
          maxLines: 2,
          style: TextStyle(fontSize: miniSize),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          getDifference(DateTime.now().difference(entity.date)),
          style: TextStyle(fontSize: miniSize, color: appGray2),
        )
      ],
    );
  }
}
