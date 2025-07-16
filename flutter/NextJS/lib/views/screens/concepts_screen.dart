import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/concept_controller.dart';
import '../../database/database_helper.dart';
import '../../models/category.dart';
import '../../models/concept.dart';
import '../widgets/concept_card.dart';
import 'content_screen.dart';

class ConceptsScreen extends StatelessWidget {
  final Category category;

  const ConceptsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbHelper = Provider.of<DatabaseHelper>(context);
    final conceptController = ConceptController(dbHelper);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        elevation: 0,
      ),
      body: FutureBuilder<List<Concept>>(
        future: conceptController.getConceptsByCategory(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No concepts found for ${category.name}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }

          final concepts = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: concepts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final concept = concepts[index];
                return ConceptCard(
                  concept: concept,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContentScreen(concept: concept),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}