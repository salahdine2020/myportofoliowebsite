import 'package:flutter/material.dart';

class LargeBackgroundText extends StatelessWidget {
  final String text;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double fontSize;
  final Color color;

  const LargeBackgroundText({
    Key? key,
    required this.text,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color.withOpacity(0.1), // Low opacity for subtle effect
          fontWeight: FontWeight.bold,
          letterSpacing: 10,
        ),
      ),
    );
  }
}
