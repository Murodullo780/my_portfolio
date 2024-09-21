import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/sudoku_game/sudoku_page.dart';
import 'package:my_portfolio/widgets/type_writer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 180,
      child: Row(
        children: [
          const Spacer(),
          const Spacer(),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4 - 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Hi, everyone. I am ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TypeWriterText(
                  text: 'Murodulloh Maxamatsobirov',
                  style: TextStyle(
                    fontSize: 62,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: Duration(milliseconds: 100),
                ),

                const TypeWriterText(
                  text: '> Flutter developer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4D5BCE),
                  ),duration: Duration(milliseconds: 200),
                ),
                const Spacer(),
                const TypeWriterText(
                  text: '// Try to play simple sudoku game\n'
                  '// You can also see my GitHub page',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff607B96),
                  ),duration: Duration(milliseconds: 50),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      fontFamily: MyFonts.firaLight,
                    ),
                    children: [
                      TextSpan(
                          text: "static const ",
                          style: TextStyle(
                            color: Color(0xffC07C41),
                          )),
                      TextSpan(
                          text: "String ",
                          style: TextStyle(
                            color: Color(0xffABB7C4),
                          )),
                      TextSpan(
                        text: "githubLink ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color(0xff9377A6),
                        ),
                      ),
                      TextSpan(
                        text: "= ",
                        style: TextStyle(
                          color: Color(0xffABB7C4),
                        ),
                      ),
                      TextSpan(
                        text: "'https://github.com/Murodullo780'",
                        style: TextStyle(
                          color: Color(0xff70865E),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.4 - 60,
              height: MediaQuery.of(context).size.width * 0.4 - 60,
              child: const SudokuApp()),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
