import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_slider.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TestsPage extends StatefulWidget{
  const TestsPage({super.key});
  @override
  State<StatefulWidget> createState() => _TestsPageState();

}
class _TestsPageState extends State<TestsPage>{
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSlider(
                wight: 100.w - widgetPadding*2,
                onSelect: (value){
                  pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                },
                children: [
                  S.of(context).test_section_1,
                  S.of(context).test_section_2
                ]
            ),
            SizedBox(height: 2.h,),
            Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    Column(
                      children: [
                        Flexible(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [Colors.white, Colors.white.withOpacity(0.01)],
                                  begin: Alignment.topCenter,
                                  stops: const [0.9, 1],
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: ListView.separated(
                                  itemCount: 5,
                                  //shrinkWrap: expanded,
                                  controller: scrollController,
                                  separatorBuilder: (context,index){
                                    return Divider(height: 3.h,);
                                  },
                                  itemBuilder: (context, index){
                                    return _testImageWidget();
                                  }
                              ),
                            )
                        ),
                        SizedBox(height: 2.h,),
                        Text(S.of(context).test_current, style: TextStyle(fontSize: buttonTextSize, fontWeight: FontWeight.w600),),
                        SizedBox(height: 1.h,),
                        Flexible(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [Colors.white, Colors.white.withOpacity(0.01)],
                                  begin: Alignment.topCenter,
                                  stops: const [0.9, 1],
                                  end: Alignment.bottomCenter,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: ListView.separated(
                                  itemCount: 5,
                                  separatorBuilder: (context,index){
                                    return Divider(height: 3.h,);
                                  },
                                  itemBuilder: (context, index){
                                    return _testWidget();
                                  }
                              ),
                            )
                        ),
                      ],
                    ),
                    Center(
                      child: Text(S.of(context).test_result_not_found, ),
                    )
                  ],
                )
            ),

          ],
    );
  }
  Widget _testWidget(){
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Тест", style: TextStyle(fontSize: mainSize, fontWeight: FontWeight.w600),),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod", maxLines: 2,overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: miniSize, color: appGray6),),
              Text(getDifference(Duration(minutes: 10)), style: TextStyle(fontSize: miniSize, color: appGray2),),
            ],
          )),
          SizedBox(width: 2.w,),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }
  Widget _testImageWidget(){
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 15.w,
            height: 15.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/lesson_test_image.png", fit: BoxFit.fill,),
            ),
          ),
          SizedBox(width: 2.w,),
          Flexible(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Тест", style: TextStyle(fontSize: mainSize, fontWeight: FontWeight.w600),),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod", maxLines: 2,overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: miniSize, color: appGray6),)
            ],
          )),
          SizedBox(width: 2.w,),
          Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }
}