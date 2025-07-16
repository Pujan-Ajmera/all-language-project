import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CodeBlock extends StatelessWidget {
  final String content;

  const CodeBlock({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SelectableText(
          content,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}