import 'package:flutter/material.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CourseViewPage extends StatefulWidget{
  final String title;
  const CourseViewPage({required this.title,super.key});

  @override
  State<StatefulWidget> createState() => _CourseViewPageState();
  
}
class _CourseViewPageState extends State<CourseViewPage>{
  List<String> course_lessons = [
    "Интенсив по математике",
    "Тригонометрия",
    "Тригонометрия"
  ];
  List<String> course_images = [
    "lesson_test_image.png",
    "lesson_test_image1.png",
    "lesson_test_image2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero
            ),
              onPressed: (){
            Navigator.pop(context);
          }, child: Text(S.of(context).back, style: TextStyle(color: primaryColor),))
        ],),
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(fontSize: welcomeTitleSize, fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: EdgeInsets.all(widgetPadding),
        child: ListView.separated(
            itemBuilder: (context,index){
              return _lessonWidget(index);
            },
            separatorBuilder: (context,index){
              return Divider(height: 3.h,);
            },
            itemCount: 3),
      ),
    );
  }
  Widget _lessonWidget(int index){
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 20.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/${course_images[index]}", fit: BoxFit.fill,),
          ),
        ),
        SizedBox(height: 1.h,),
        //title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(course_lessons[index],style: TextStyle(fontWeight: FontWeight.w600, fontSize: mainSize),),
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
        SizedBox(height: 1.h,),
        Align(alignment: Alignment.centerLeft,child: Text(S.of(context).lesson_from("Анны", "Самолиной"), style: TextStyle(color: appGray6, fontSize: miniSize),),),
        SizedBox(height: 1.h,),
      ],
    );
  }
}