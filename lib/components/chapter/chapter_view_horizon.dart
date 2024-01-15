import 'package:doc_truyen_online_mobile/app/chapter_provider.dart';
import 'package:doc_truyen_online_mobile/components/layouts/multi_page_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChapterViewHorizon extends StatelessWidget {
  final String content;

  const ChapterViewHorizon({
    super.key,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ChapterProvider>(
      builder: (context, value, child) {
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: value.color.background,
          ),
          child: MultiPageText(
            textStyle: GoogleFonts.getFont(
              value.font,
              textStyle: TextStyle(
                color: value.color.foreground,
                fontSize: value.fontSize,
              ),
            ),
            paddingTextBox: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            fullText: content,
            usePageNavigation: false,
            size: Size(
              size.width,
              size.height - 150,
            ),
          ),
        );
      },
    );
  }
}
