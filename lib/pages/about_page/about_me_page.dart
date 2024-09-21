import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/strings.dart';
import 'package:my_portfolio/pages/about_page/models/file_model.dart';
import 'package:my_portfolio/pages/about_page/utils/variables.dart';
import 'package:my_portfolio/pages/about_page/widgets/opened_pages.dart';
import 'package:my_portfolio/pages/about_page/widgets/packages_widget.dart';
import 'package:my_portfolio/pages/about_page/widgets/bio_widget.dart';

import 'package:my_portfolio/pages/about_page/widgets/text_widget_with_line_counter.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with VariablesAboutPage {
  String linesCounter = "";
  late TextWidgetWithCountLineCallback textWidget;

  String meetingDay(DateTime dateTime) {
    if (dateTime.hour > 12) {
      return 'Afternoon';
    } else {
      return 'Morning';
    }
  }

  int linesI = 0;
  String text = "";

  void init() async {
    text = ""
        "Good ${meetingDay(DateTime.now())}! Here information about me\n"
        "My name is Murodulloh so:\n"
        "${StringsConst.aboutMe}";
    textWidget = TextWidgetWithCountLineCallback(
      textWidget: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      callback: (lines) {
        for (int i = 0; i < lines; i++) {
          linesCounter += "$i";
        }
        debugPrint('lines:$linesCounter');
        linesI = lines;
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 180,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            child: PackagesWidget(),
          ),
          SizedBox(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 390,
                  child: OpenedPages(
                    close: (int index) {
                      debugPrint('close: $index');
                      if (files.length > 1) {
                        files.removeAt(index);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'You can not close last page',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }
                      setState(() {});
                    },
                    onTap: (int index) {
                      debugPrint('index: $index');
                      selectedIndex = index;
                      // setState(() {});
                    },
                    selectedIndex: selectedIndex,
                    pages: files.map((e) => e.name).toList(),
                  ),
                ),
                files[selectedIndex].body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
