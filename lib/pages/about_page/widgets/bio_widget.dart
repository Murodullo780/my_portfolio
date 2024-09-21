import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/strings.dart';
import 'package:my_portfolio/pages/about_page/widgets/text_widget_with_line_counter.dart';

String linesCounter = "";
int linesI = 0;
// final Widget textWidget = TextWidgetWithCountLineCallback(
//   textWidget: Text(
//     text,
//     style: const TextStyle(fontSize: 18),
//   ),
//   callback: (lines) {
//     for (int i = 0; i < lines; i++) {
//       linesCounter += "$i";
//     }
//     debugPrint('lines:$linesCounter');
//     linesI = lines;
//   },
// );

String text = ""
"Hi! Here information about me\n"
"My name is Murodulloh so:\n"
"${StringsConst.aboutMe}";

class ReadmeWidget extends StatelessWidget {

  const ReadmeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            linesI,
            (index) {
              debugPrint('index: $index');
              return Text(
                (index + 1).toString(),
                style: const TextStyle(fontSize: 18),
              );
            },
          ),
        ),
        const SizedBox(width: 40),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9 - 330,
          child: TextWidgetWithCountLineCallback(
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
          ),
        ),
      ],
    );
  }
}
