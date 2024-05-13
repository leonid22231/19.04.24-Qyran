import 'package:flutter/material.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/secondary/course_view_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoursePage extends StatefulWidget{

  const CoursePage({super.key});
  @override
  State<StatefulWidget> createState() => _CoursePageState();

}
class _CoursePageState extends State<CoursePage>{
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  final _mainNavigatorKey = GlobalKey<NavigatorState>();
  List<String> testLearns = [
    "Математика",
    "Информатика",
    "Физика",
    "Всемирная история",
    "История Казахстана",
    "Математическая грамотность",
    "Английский язык",
    "Биология",
    "География",
    "Химия"
  ];
  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
         SizedBox(height: 2.h,),
         CustomSlider(
           onSelect: (value){
             pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.linear);
           },
           wight: 100.w - widgetPadding*2,
             children: [
               S.of(context).course_section_1,
               S.of(context).course_section_2
             ]
         ),
         SizedBox(height: 2.h,),
         Expanded(child: PageView(
           physics: const NeverScrollableScrollPhysics(),
           controller: pageController,
           children: [
             ListView.separated(
                 itemBuilder: (context, index){
                   return _itemWidget(index);
                 },
                 separatorBuilder: (context,index){
                   return SizedBox(height: 1.h,);
                 },
                 itemCount: 10
             ),
             ListView.separated(
                 itemBuilder: (context, index){
                   return _comboWidget();
                 },
                 separatorBuilder: (context,index){
                   return Divider(height: 4.h,);
                 },
                 itemCount: 10
             ),

           ],
         )
         )
       ],
     );
  }
  Widget _comboWidget(){
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 20.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/lesson_test_image.png", fit: BoxFit.fill,),
          ),
        ),
        SizedBox(height: 1.h,),
        //title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Математика и информатика",style: TextStyle(fontWeight: FontWeight.w600, fontSize: mainSize),),
                SizedBox(width: 2.w,),
                Row(
                  children: [
                    Icon(Icons.star, color: gold,size: 4.w,),
                    SizedBox(width: 2.w,),
                    Text("4.5", style: TextStyle(color: appGray6, fontSize: miniSize),)
                  ],
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right_outlined)
          ],
        ),
        SizedBox(height: 1.h,),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
          style: TextStyle(color: appGray6, fontSize: miniSize),maxLines: 3,overflow: TextOverflow.ellipsis,),
      ],
    );
  }
  Widget _itemWidget(int index){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseViewPage(title: testLearns[index],)));
      },
      highlightColor: primaryColor.withOpacity(0.3),
      splashColor: primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.maxFinite,
        padding: EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(testLearns[index], style: TextStyle(color: appGray5, fontWeight: FontWeight.w400, fontSize: mainSize),),
            Icon(Icons.keyboard_arrow_right_outlined, color: appGray5,)
          ],
        ),
      ),
    );
  }
}