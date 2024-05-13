import 'package:flutter/cupertino.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsPage extends StatefulWidget{
  const NewsPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsPageState();

}
class _NewsPageState extends State<NewsPage>{
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 37.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                PageView.builder(
                  itemCount: 3,
                  padEnds: false,
                  controller: controller,
                  itemBuilder: (context,index){
                    return _itemNew("new_test_image.png", "Математика");
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
          ),
          SizedBox(height: 2.h,),
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context,index){
                return _itemNew("new_test_image2.png", "Физика");
              },
              separatorBuilder: (context,index){
                return SizedBox(height: 1.h,);
              },
              itemCount: 2
          )
        ],
      ),
    );
  }
Widget _itemNew(String image, String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 25.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/$image", fit: BoxFit.fill,),
          ),
        ),
        SizedBox(height: 1.h,),
        Text(title, style: TextStyle(fontSize: mainSize, fontWeight: FontWeight.w600),),
        SizedBox(height: 1.h,),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", maxLines: 2, style: TextStyle(fontSize: miniSize),overflow: TextOverflow.ellipsis,),
        SizedBox(height: 1.h,),
        Text(getDifference(const Duration(minutes: 10)), style: TextStyle(fontSize: miniSize, color: appGray2),)
      ],
    );
}
}