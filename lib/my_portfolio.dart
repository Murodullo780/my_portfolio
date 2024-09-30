import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about_page/about_me_page.dart';
import 'package:my_portfolio/pages/bottom_navigation/my_bottom_navigation.dart';
import 'package:my_portfolio/pages/main_page/main_page.dart';
import 'package:my_portfolio/pages/projects/projects_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    const ProjectsPage(),
    const MainPage(),
    const AboutMePage(),
  ];

  @override
  void initState() {
    debugPrint( "You are running the web application on ${defaultTargetPlatform.name}",);
    super.initState();
  }

  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010C15),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          // color: Colors.black,
          color: const Color(0xff011627),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withAlpha(50),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 59,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.white.withAlpha(50),
                width: 0.5,
              ))),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 22.0, right: 55),
                    child: Text(
                      "maxamatsobirov_murodulloh",
                      style: TextStyle(color: Color(0xff607B96), fontSize: 16),
                    ),
                  ),
                  MyBottomNavigation(
                    items: [
                      MyBottomItem(title: "hello"),
                      MyBottomItem(title: "aboutMe"),
                      MyBottomItem(title: "projects"),
                    ],
                    selectedIndex: selectedIndex.value,
                    onPress: (i) {
                      selectedIndex.value = i;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            // const Spacer(),
            ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return pages[value];
              },
            ),
            // const Spacer(),
            Container(
              height: 59,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withAlpha(50),
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 22.0, right: 55),
                    child: Text(
                      "find_me_in: ",
                      style: TextStyle(color: Color(0xff607B96), fontSize: 16),
                    ),
                  ),
                  MyBottomNavigation(
                    items: [
                      MyBottomItem(title: "telegram"),
                    ],
                    selectedIndex: 10,
                    onPress: (i) {
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
