import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import '../../controllers/content_block_controller.dart';
import '../../controllers/quiz_controller.dart';
import '../../database/database_helper.dart';
import '../../models/concept.dart';
import '../../models/content_block.dart';
import '../../models/quiz.dart';
import '../widgets/code_block.dart';
import 'quiz_screen.dart';

class ContentScreen extends StatelessWidget {
  final Concept concept;

  const ContentScreen({Key? key, required this.concept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbHelper = Provider.of<DatabaseHelper>(context);
    final contentController = ContentBlockController(dbHelper);
    final quizController = QuizController(dbHelper);

    return Scaffold(
      appBar: AppBar(
        title: Text(concept.title),
      ),
      body: FutureBuilder<List<ContentBlock>>(
        future: contentController.getContentBlocksByConcept(concept.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No content found'));
          }

          final contentBlocks = snapshot.data!;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: contentBlocks.length,
                  itemBuilder: (context, index) {
                    final block = contentBlocks[index];
                    if (block.type == 'paragraph') {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MarkdownBody(data: block.content),
                      );
                    } else if (block.type == 'code') {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CodeBlock(content: block.content),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              FutureBuilder<List<Quiz>>(
                future: quizController.getQuizzesByConcept(concept.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                quiz: snapshot.data!.first,
                              ),
                            ),
                          );
                        },
                        child: const Text('Take Quiz'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}