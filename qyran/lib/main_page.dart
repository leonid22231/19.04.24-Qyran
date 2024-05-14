import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/main/course_page.dart';
import 'package:qyran/main/lessons_page.dart';
import 'package:qyran/main/news_page.dart';
import 'package:qyran/main/profile_page.dart';
import 'package:qyran/main/tests_page.dart';
import 'package:qyran/utils/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool button = false;
  int pageIndex = 0;
  List<FlashyTabBarItem> bottomBarItems = [];
  @override
  Widget build(BuildContext context) {
    bottomBarItems = [
      FlashyTabBarItem(icon: SvgPicture.asset("assets/home.svg"), title: Text(S.of(context).bottomBar_item1), activeColor: primaryColor),
      FlashyTabBarItem(icon: SvgPicture.asset("assets/lessons.svg"), title: Text(S.of(context).bottomBar_item2), activeColor: primaryColor),
      FlashyTabBarItem(icon: SvgPicture.asset("assets/tests.svg"), title: Text(S.of(context).bottomBar_item3), activeColor: primaryColor),
      FlashyTabBarItem(icon: SvgPicture.asset("assets/news.svg"), title: Text(S.of(context).bottomBar_item4), activeColor: primaryColor),
      FlashyTabBarItem(icon: SvgPicture.asset("assets/profile.svg"), title: Text(S.of(context).bottomBar_item5), activeColor: primaryColor),
    ];
    Text appbarTitle = bottomBarItems[pageIndex].title as Text;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          appbarTitle.data!,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
              ))
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: pageIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          pageIndex = index;
        }),
        items: bottomBarItems,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.h).copyWith(bottom: _bottomPadding(pageIndex)),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _getPage(pageIndex),
              );
            },
          ),
        ),
      ),
    );
  }

  double _bottomPadding(int index) {
    switch (index) {
      case 0:
        return 0;
      default:
        return widgetPadding;
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const LoaderOverlay(
          child: CoursePage(),
        );
      case 1:
        return NotificationListener<NotifyCourse>(
            onNotification: (m) {
              pageIndex = 0;
              setState(() {});
              debugPrint("Notify course ");
              return true;
            },
            child: const LessonsPage());
      case 2:
        return const TestsPage();
      case 3:
        return const NewsPage();
      case 4:
        return const LoaderOverlay(child: ProfilePage());
      default:
        return const SizedBox.shrink();
    }
  }
}
