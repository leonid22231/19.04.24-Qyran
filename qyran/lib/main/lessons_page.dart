import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:qyran/widgets/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LessonsPage extends StatefulWidget{
  const LessonsPage({super.key});
  @override
  State<StatefulWidget> createState() => _LessonsPageState();
}
class _LessonsPageState extends State<LessonsPage>{
  String? search;
  bool empty = false;
  @override
  Widget build(BuildContext context) {
    return empty?Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).lessons_empty, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: mainSize),),
        CustomButton(
            color: primaryColor,
            onPress: (){
              NotifyCourse().dispatch(context);
            },
            title: S.of(context).bottomBar_item1
        )
      ],
    ):Column(
      children: [
        Expanded(child: ListView.separated(
            itemBuilder: (context,index){
              return _lessonWidget();
            },
            separatorBuilder: (context,index){
              return Divider(height: 4.h,);
            },
            itemCount: 2))
      ],
    );
  }
  Widget _lessonWidget(){
    int percent = 25;
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
                    Text("Интенсив по математике",style: TextStyle(fontWeight: FontWeight.w600, fontSize: mainSize),),
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
        Row(
          children: [
            SizedBox.fromSize(
              size: Size.fromRadius(progressRadius),
              child: CircularPercentIndicator(
                radius: progressRadius,
                lineWidth: 6.0,
                backgroundColor: Colors.transparent,
                percent: percent/100,
                center: Text("$percent%", style: GoogleFonts.raleway().copyWith(fontSize: buttonTextSize,color: primaryColor, fontWeight: FontWeight.w600),),
                progressColor: primaryColor,
              ),
            ),
            SizedBox(width: 10.w,),
            Flexible(child: CustomButton(
                height: Size.fromRadius(progressRadius).height,
                onPress: (){

                },
                color: primaryColor,
                title: S.of(context).continue_
            )
            ),
          ],
        )
      ],
    );
  }
}

class NotifyCourse extends Notification{
  NotifyCourse();
}