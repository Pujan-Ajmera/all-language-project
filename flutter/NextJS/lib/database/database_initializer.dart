import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/category.dart';
import '../models/concept.dart';
import '../models/content_block.dart';
import '../models/quiz.dart';
import '../models/question.dart';
import 'database_helper.dart';

class DatabaseInitializer {
  final DatabaseHelper dbHelper;

  DatabaseInitializer(this.dbHelper);

  Future<void> initializeDatabase() async {
    final db = await dbHelper.database;

    // Check if data already exists
    final categoriesCount = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM categories')
    );

    if (categoriesCount == 0) {
      await _insertInitialData(db);
    }
  }

  Future<void> _insertInitialData(Database db) async {
    // Insert categories
    final categories = [
      Category(id: 1, name: 'Routing', description: 'Learn how routing works'),
      Category(id: 2, name: 'Data Fetching', description: 'Understand server-side logic'),
      Category(id: 3, name: 'Authentication', description: 'Login systems in Next.js'),
      Category(id: 4, name: 'Styling', description: 'Styling techniques in Next.js'),
    ];

    for (var category in categories) {
      await db.insert('categories', category.toMap());
    }

    // Insert concepts
    final concepts = [
      Concept(id: 1, categoryId: 1, title: 'File-based Routing', description: 'Pages based on file names'),
      Concept(id: 2, categoryId: 1, title: 'Dynamic Routing', description: 'Using `[param]` to make dynamic pages'),
      Concept(id: 3, categoryId: 2, title: 'getServerSideProps', description: 'Fetch data on every request'),
      Concept(id: 4, categoryId: 2, title: 'getStaticProps', description: 'Fetch data at build time'),
      Concept(id: 5, categoryId: 3, title: 'JWT Authentication', description: 'Auth with tokens'),
      Concept(id: 6, categoryId: 3, title: 'NextAuth.js', description: 'Simplified auth using NextAuth'),
      Concept(id: 7, categoryId: 4, title: 'CSS Modules', description: 'Scoped CSS files'),
      Concept(id: 8, categoryId: 4, title: 'Tailwind CSS Integration', description: 'Utility-first CSS setup'),
    ];

    for (var concept in concepts) {
      await db.insert('concepts', concept.toMap());
    }

    // Insert content blocks
    final contentBlocks = [
      ContentBlock(id: 1, conceptId: 1, type: 'paragraph', content: 'Next.js uses a file-based routing system. Create `pages/about.js` and it becomes `/about`.'),
      ContentBlock(id: 2, conceptId: 1, type: 'code', content: 'export default function About() { return <h1>About</h1>; }'),
      ContentBlock(id: 3, conceptId: 2, type: 'paragraph', content: 'Dynamic routing uses square brackets like `[id].js`. It allows pages to be dynamic.'),
      ContentBlock(id: 4, conceptId: 2, type: 'code', content: 'pages/post/[id].js → /post/123 maps to that file.'),
      ContentBlock(id: 5, conceptId: 3, type: 'paragraph', content: 'getServerSideProps runs on each request to fetch data dynamically.'),
      ContentBlock(id: 6, conceptId: 3, type: 'code', content: 'export async function getServerSideProps() { return { props: {} }; }'),
      ContentBlock(id: 7, conceptId: 4, type: 'paragraph', content: 'getStaticProps fetches data at build time, ideal for static sites.'),
      ContentBlock(id: 8, conceptId: 4, type: 'code', content: 'export async function getStaticProps() { return { props: {} }; }'),
      ContentBlock(id: 9, conceptId: 5, type: 'paragraph', content: 'JWT tokens are sent with requests for authenticated APIs.'),
      ContentBlock(id: 10, conceptId: 5, type: 'code', content: 'const token = jwt.sign({ userId }, SECRET_KEY);'),
      ContentBlock(id: 11, conceptId: 6, type: 'paragraph', content: 'NextAuth provides ready-to-use OAuth + custom login flows.'),
      ContentBlock(id: 12, conceptId: 6, type: 'code', content: 'import NextAuth from "next-auth"'),
      ContentBlock(id: 13, conceptId: 7, type: 'paragraph', content: 'CSS Modules scope your styles per component. File: `Component.module.css`'),
      ContentBlock(id: 14, conceptId: 7, type: 'code', content: '.title { color: red; } and import styles from \'./Component.module.css\''),
      ContentBlock(id: 15, conceptId: 8, type: 'paragraph', content: 'Tailwind CSS can be easily integrated with Next.js via PostCSS.'),
      ContentBlock(id: 16, conceptId: 8, type: 'code', content: 'npm install -D tailwindcss postcss autoprefixer then npx tailwindcss init'),
    ];

    for (var block in contentBlocks) {
      await db.insert('content_blocks', block.toMap());
    }

    // Insert quizzes
    final quizzes = [
      Quiz(id: 1, conceptId: 1, title: 'Routing Basics'),
      Quiz(id: 2, conceptId: 3, title: 'Server Side Logic'),
      Quiz(id: 3, conceptId: 5, title: 'JWT Authentication'),
      Quiz(id: 4, conceptId: 8, title: 'Tailwind Knowledge'),
    ];

    for (var quiz in quizzes) {
      await db.insert('quizzes', quiz.toMap());
    }

    // Insert questions
    final questions = [
      Question(
          id: 1,
          quizId: 1,
          question: 'What file makes `/about` page?',
          optionA: 'pages/index.js',
          optionB: 'pages/home.js',
          optionC: 'pages/about.js',
          optionD: 'pages/_about.js',
          correctOption: 'C'
      ),
      Question(
          id: 2,
          quizId: 1,
          question: 'What symbol is used for dynamic routing?',
          optionA: '{param}',
          optionB: '(param)',
          optionC: ':param',
          optionD: '[param]',
          correctOption: 'D'
      ),
      Question(
          id: 3,
          quizId: 2,
          question: 'When does getServerSideProps run?',
          optionA: 'During build',
          optionB: 'On every request',
          optionC: 'Only on deployment',
          optionD: 'Never',
          correctOption: 'B'
      ),
      Question(
          id: 4,
          quizId: 3,
          question: 'JWT tokens are used for?',
          optionA: 'Styling',
          optionB: 'Authentication',
          optionC: 'Routing',
          optionD: 'Image optimization',
          correctOption: 'B'
      ),
      Question(
          id: 5,
          quizId: 4,
          question: 'What is the default utility prefix in Tailwind?',
          optionA: 'tw-',
          optionB: 'tail-',
          optionC: 'twcss-',
          optionD: 'No prefix',
          correctOption: 'D'
      ),
      Question(
          id: 6,
          quizId: 4,
          question: 'How do you initialize Tailwind CSS in Next.js?',
          optionA: 'npx tailwind-init',
          optionB: 'npx create-tailwind',
          optionC: 'npx tailwindcss init',
          optionD: 'npx init tailwind',
          correctOption: 'C'
      ),
    ];

    for (var question in questions) {
      await db.insert('questions', question.toMap());
    }
  }
}