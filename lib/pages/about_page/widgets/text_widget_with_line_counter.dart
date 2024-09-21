import 'package:flutter/material.dart';

class TextWidgetWithCountLineCallback extends StatelessWidget {
  final Text textWidget;
  final Function(int) callback;
  final TextStyle? textStyle;

  const TextWidgetWithCountLineCallback(
      {super.key,
      required this.textWidget,
      required this.callback,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = textStyle ?? DefaultTextStyle.of(context).style;
    final textStyleOfTextWidget = textWidget.style ?? defaultTextStyle;

    final textStyleForPainter = textStyleOfTextWidget.letterSpacing == null
        ? textStyleOfTextWidget.copyWith(
            letterSpacing: defaultTextStyle.letterSpacing)
        : textStyleOfTextWidget;
    final textWidgetForPainter =
        TextSpan(text: textWidget.data, style: textStyleForPainter);
    final textPainter = TextPainter(
        text: textWidgetForPainter,
        maxLines: null,
        textDirection: TextDirection.ltr);

    return LayoutBuilder(
      builder: (context, constraints) {
        textPainter.layout(maxWidth: constraints.maxWidth);
        final countLine = textPainter.computeLineMetrics().length;
        callback(countLine);

        return textWidget;
      },
    );
  }
}

class ResponsiveWidth extends StatefulWidget {
  final Widget child;

  const ResponsiveWidth({super.key, required this.child});

  @override
  State<ResponsiveWidth> createState() => _ResponsiveWidthState();
}

class _ResponsiveWidthState extends State<ResponsiveWidth> {
  double _scaleValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Slider(
            value: _scaleValue,
            min: 0,
            max: 1,
            onChanged: (newValue) {
              setState(() => _scaleValue = newValue);
            },
          ),
          Container(
            width:
                _scaleValue * MediaQuery.of(context).size.width * _scaleValue,
            color: Colors.grey,
            child: Center(child: widget.child),
          ),
        ],
      ),
    );
  }
}
