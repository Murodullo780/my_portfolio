import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/about_page/widgets/text_widget_with_line_counter.dart';

String linesCounter = "";
int linesI = 0;

String text = ""
    "Hi there! My name is Murodulloh and I'm a Flutter developer. "
    "and you can try this page. If you want to know more about me, "
    "please chose one of the pages in the left side menu.\n"
    "At the moment I don't have ideas to fill this page, if you have any ideas, you can send me on telegram @murodulloh.\n"
    "P.S. here also some issues. I'm working on it.";

class ReadmeWidget extends StatelessWidget {
  const ReadmeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
