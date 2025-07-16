import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/concept_controller.dart';
import '../../database/database_helper.dart';
import '../../models/category.dart';
import '../../models/concept.dart';
import '../widgets/custom_app_bar.dart';
import 'content_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbHelper = Provider.of<DatabaseHelper>(context);
    final categoryController = CategoryController(dbHelper);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Next.js Learning Path'),
      body: FutureBuilder<List<Category>>(
        future: categoryController.getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          }

          final categories = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    category.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(category.description),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConceptsScreen(category: category),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ConceptsScreen extends StatelessWidget {
  final Category category;

  const ConceptsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbHelper = Provider.of<DatabaseHelper>(context);
    final conceptController = ConceptController(dbHelper);

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: FutureBuilder<List<Concept>>(
        future: conceptController.getConceptsByCategory(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No concepts found'));
          }

          final concepts = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: concepts.length,
            itemBuilder: (context, index) {
              final concept = concepts[index];
              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    concept.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(concept.description),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContentScreen(concept: concept),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}