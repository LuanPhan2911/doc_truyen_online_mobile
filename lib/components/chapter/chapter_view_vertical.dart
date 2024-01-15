import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterViewVertical extends StatelessWidget {
  final String content;
  final String font;
  final Color foreground;
  final double fontSize;
  final Color background;
  const ChapterViewVertical({
    super.key,
    required this.content,
    required this.font,
    required this.foreground,
    required this.fontSize,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: background,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 10,
        ),
        child: Text(
          content,
          style: GoogleFonts.getFont(
            font,
            textStyle: TextStyle(
              color: foreground,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
