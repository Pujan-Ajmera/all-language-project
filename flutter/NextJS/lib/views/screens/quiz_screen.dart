import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/question_controller.dart';
import '../../database/database_helper.dart';
import '../../models/question.dart';
import '../../models/quiz.dart';
import '../widgets/quiz_option.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedOption;
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final dbHelper = Provider.of<DatabaseHelper>(context, listen: false);
    final questionController = QuestionController(dbHelper);
    final questions = await questionController.getQuestionsByQuiz(widget.quiz.id);
    setState(() {
      _questions = questions;
    });
  }

  void _nextQuestion() {
    if (_selectedOption == _questions[_currentQuestionIndex].correctOption) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOption = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            totalQuestions: _questions.length,
            quiz: widget.quiz,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              currentQuestion.question,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  QuizOption(
                    option: 'A',
                    text: currentQuestion.optionA,
                    isSelected: _selectedOption == 'A',
                    onTap: () => setState(() => _selectedOption = 'A'),
                  ),
                  QuizOption(
                    option: 'B',
                    text: currentQuestion.optionB,
                    isSelected: _selectedOption == 'B',
                    onTap: () => setState(() => _selectedOption = 'B'),
                  ),
                  QuizOption(
                    option: 'C',
                    text: currentQuestion.optionC,
                    isSelected: _selectedOption == 'C',
                    onTap: () => setState(() => _selectedOption = 'C'),
                  ),
                  QuizOption(
                    option: 'D',
                    text: currentQuestion.optionD,
                    isSelected: _selectedOption == 'D',
                    onTap: () => setState(() => _selectedOption = 'D'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _selectedOption != null ? _nextQuestion : null,
              child: Text(
                _currentQuestionIndex < _questions.length - 1
                    ? 'Next Question'
                    : 'Finish Quiz',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}