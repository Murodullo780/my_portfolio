import 'package:flutter/material.dart';

class TypeWriterText extends StatefulWidget {
  final String text;
  final Duration duration;
  final TextStyle? style;

  const TypeWriterText({
    super.key,
    required this.text,
    this.duration = const Duration(milliseconds: 100), this.style,

  });

  @override
  _TypeWriterTextState createState() => _TypeWriterTextState();
}

class _TypeWriterTextState extends State<TypeWriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.text.length * widget.duration.inMilliseconds),
      vsync: this,
    );

    _characterCount = StepTween(begin: 0, end: widget.text.length)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        String visibleString = widget.text.substring(0, _characterCount.value);
        return Text(visibleString, style: widget.style);
      },
    );
  }
}
