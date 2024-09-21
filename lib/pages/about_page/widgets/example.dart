import 'package:flutter/material.dart';

class MyAppExample extends StatelessWidget {
  // List of special words to highlight
  final List<String> specialWords = ['This', 'important'];

  MyAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichTextWidget(
          text:
              'This is a special word and this is another important word. You can define many special words easily.',
          specialWords: specialWords,
        ),
      ),
    );
  }
}

// Widget to build the RichText with special words styled automatically
class RichTextWidget extends StatelessWidget {
  final String text;
  final List<String> specialWords;

  RichTextWidget({required this.text, required this.specialWords});

  // Function to style the words based on special words list
  List<TextSpan> _buildTextSpans(String text, List<String> specialWords) {
    List<TextSpan> spans = [];
    final words = text.split(' ');
    for (var word in words) {
      String cleanWord = word.replaceAll(RegExp(r'[^\w\s]'), '');

      if (specialWords.contains(cleanWord)) {
        spans.add(TextSpan(
          text: '$word ',
          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ));
      } else {
        // Otherwise, use default color (e.g., black)
        spans.add(
            TextSpan(text: '$word ', style: TextStyle(color: Colors.white)));
      }
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: RichText(
        text: TextSpan(
          children: _buildTextSpans(text, specialWords),
        ),
      ),
    );
  }
}
