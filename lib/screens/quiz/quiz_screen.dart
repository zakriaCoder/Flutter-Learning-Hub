// lib/screens/quiz/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/topic_model.dart';
import '../../services/progress_service.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  final Map<String, List<QuizQuestion>> quizzes = {
    'intro': [
      QuizQuestion(
        question: 'What is Flutter?',
        options: ['UI toolkit', 'Programming language', 'Database', 'Operating system'],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'Who developed Flutter?',
        options: ['Facebook', 'Google', 'Microsoft', 'Apple'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'What language is Flutter primarily written in?',
        options: ['Java', 'Kotlin', 'Dart', 'Swift'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Flutter is used for building?',
        options: ['Web apps only', 'Mobile apps only', 'Cross-platform apps', 'Desktop apps only'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Which rendering engine does Flutter use?',
        options: ['WebView', 'Skia', 'Canvas', 'OpenGL'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Flutter was first released in which year?',
        options: ['2015', '2017', '2019', '2020'],
        correctIndex: 1,
      ),
    ],
    'dart': [
      QuizQuestion(
        question: 'Dart is mainly used for?',
        options: ['Web only', 'Client-optimized apps', 'Databases', 'Operating systems'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'What keyword is used to declare a variable in Dart?',
        options: ['let', 'var', 'const', 'Both var and const'],
        correctIndex: 3,
      ),
      QuizQuestion(
        question: 'Which of these is NOT a valid Dart data type?',
        options: ['int', 'String', 'char', 'double'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'What does "final" keyword mean in Dart?',
        options: ['Variable can be changed', 'Variable cannot be reassigned', 'Variable is global', 'Variable is private'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'How do you create a list in Dart?',
        options: ['List<int> numbers = []', 'Array numbers = []', 'numbers = new List()', 'int[] numbers = []'],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'What is the entry point of a Dart application?',
        options: ['start()', 'main()', 'init()', 'run()'],
        correctIndex: 1,
      ),
    ],
    'widgets': [
      QuizQuestion(
        question: 'In Flutter, everything is a ____.',
        options: ['Function', 'Widget', 'Class', 'Package'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which widget is used to display text?',
        options: ['Label', 'Text', 'TextView', 'TextWidget'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'What type of widget does NOT maintain state?',
        options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'Container'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which widget is used to make a scrollable list?',
        options: ['Column', 'Row', 'ListView', 'Container'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'What widget would you use to add padding?',
        options: ['Margin', 'Padding', 'Space', 'Gap'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which widget allows overlapping of widgets?',
        options: ['Row', 'Column', 'Stack', 'Flex'],
        correctIndex: 2,
      ),
    ],
    'layout': [
      QuizQuestion(
        question: 'Which widget is used for horizontal layout?',
        options: ['Column', 'Row', 'Stack', 'ListView'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which widget arranges children vertically?',
        options: ['Row', 'Column', 'Stack', 'Wrap'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'What property controls alignment in Row and Column?',
        options: ['alignment', 'mainAxisAlignment', 'position', 'layout'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which widget is used for flexible layouts?',
        options: ['Container', 'Flexible', 'Box', 'Div'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Expanded widget is used for?',
        options: ['Fixed size', 'Taking available space', 'Scrolling', 'Animation'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which property defines spacing between children in Row?',
        options: ['gap', 'spacing', 'mainAxisSpacing', 'Use SizedBox'],
        correctIndex: 3,
      ),
    ],
    'navigation': [
      QuizQuestion(
        question: 'What is used to push a new screen?',
        options: ['Navigator.push', 'setState', 'Provider', 'FutureBuilder'],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'How do you go back to the previous screen?',
        options: ['Navigator.back', 'Navigator.pop', 'Navigator.return', 'Navigator.previous'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which method removes all previous routes?',
        options: ['Navigator.removeAll', 'Navigator.pushReplacement', 'Navigator.pushAndRemoveUntil', 'Navigator.clear'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'What is used to pass data to a new screen?',
        options: ['Global variables', 'Constructor parameters', 'SharedPreferences', 'Database'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Named routes are defined in?',
        options: ['main.dart routes', 'Each screen', 'navigation.dart', 'routes.dart'],
        correctIndex: 0,
      ),
      QuizQuestion(
        question: 'How do you get data back from a popped screen?',
        options: ['Navigator.getResult', 'await Navigator.push', 'Navigator.getData', 'Using callback'],
        correctIndex: 1,
      ),
    ],
    'state': [
      QuizQuestion(
        question: 'What method rebuilds the UI in StatefulWidget?',
        options: ['initState', 'dispose', 'setState', 'build'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'Where should you initialize state variables?',
        options: ['build()', 'initState()', 'constructor', 'dispose()'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'What is called when a StatefulWidget is removed?',
        options: ['destroy()', 'dispose()', 'remove()', 'close()'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which state management solution is built into Flutter?',
        options: ['Redux', 'Provider', 'InheritedWidget', 'MobX'],
        correctIndex: 2,
      ),
      QuizQuestion(
        question: 'What does setState() do?',
        options: ['Creates new state', 'Triggers rebuild', 'Saves state', 'Destroys state'],
        correctIndex: 1,
      ),
      QuizQuestion(
        question: 'Which lifecycle method is called first?',
        options: ['build()', 'initState()', 'didChangeDependencies()', 'createState()'],
        correctIndex: 3,
      ),
    ],
  };

  final Map<String, IconData> topicIcons = {
    'intro': Icons.rocket_launch,
    'dart': Icons.code,
    'widgets': Icons.widgets,
    'layout': Icons.view_quilt,
    'navigation': Icons.navigation,
    'state': Icons.settings_suggest,
  };

  final Map<String, Color> topicColors = {
    'intro': Colors.blue,
    'dart': Colors.teal,
    'widgets': Colors.purple,
    'layout': Colors.orange,
    'navigation': Colors.pink,
    'state': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Quiz Challenge', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: quizzes.keys.length,
          itemBuilder: (context, index) {
            final topicId = quizzes.keys.elementAt(index);
            final color = topicColors[topicId] ?? Colors.blue;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TopicQuizScreen(
                      topicId: topicId,
                      questions: quizzes[topicId]!,
                      color: color,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.7), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          topicIcons[topicId] ?? Icons.quiz,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        topicId.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${quizzes[topicId]!.length} Questions',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TopicQuizScreen extends StatefulWidget {
  final String topicId;
  final List<QuizQuestion> questions;
  final Color color;

  const TopicQuizScreen({
    super.key,
    required this.topicId,
    required this.questions,
    required this.color,
  });

  @override
  State<TopicQuizScreen> createState() => _TopicQuizScreenState();
}

class _TopicQuizScreenState extends State<TopicQuizScreen> with SingleTickerProviderStateMixin {
  int currentQuestion = 0;
  int score = 0;
  late List<int?> selectedAnswers;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isAnswered = false;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.questions.length, null);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    if (_isAnswered) return;

    setState(() {
      selectedAnswers[currentQuestion] = index;
      _isAnswered = true;
      if (index == widget.questions[currentQuestion].correctIndex) {
        score++;
      }
    });
  }

  void _nextOrFinish() {
    if (currentQuestion < widget.questions.length - 1) {
      setState(() {
        currentQuestion++;
        _isAnswered = false;
        _animationController.reset();
        _animationController.forward();
      });
    } else {
      _submitQuiz();
    }
  }

  void _submitQuiz() {
    final progress = Provider.of<ProgressService>(context, listen: false);
    progress.saveQuizScore(widget.topicId, score);

    final percentage = (score / widget.questions.length) * 100;
    final isPassed = percentage >= 70;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: isPassed
                  ? [Colors.green[400]!, Colors.green[600]!]
                  : [Colors.orange[400]!, Colors.orange[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPassed ? Icons.emoji_events : Icons.refresh,
                  size: 60,
                  color: isPassed ? Colors.green[600] : Colors.orange[600],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                isPassed ? 'Congratulations!' : 'Keep Trying!',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isPassed
                    ? 'You passed the quiz!'
                    : 'You can do better!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Score:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '$score / ${widget.questions.length}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Percentage:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${percentage.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: isPassed ? Colors.green[600] : Colors.orange[600],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentQuestion];
    final progress = (currentQuestion + 1) / widget.questions.length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Question ${currentQuestion + 1}/${widget.questions.length}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(widget.color),
              ),
            ),
          ),
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: widget.color.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        question.question,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ...List.generate(question.options.length, (index) {
                      final isSelected = selectedAnswers[currentQuestion] == index;
                      final isCorrect = index == question.correctIndex;
                      final showResult = _isAnswered;

                      Color? cardColor;
                      if (showResult) {
                        if (isSelected && isCorrect) {
                          cardColor = Colors.green;
                        } else if (isSelected && !isCorrect) {
                          cardColor = Colors.red;
                        } else if (!isSelected && isCorrect) {
                          cardColor = Colors.green.withOpacity(0.3);
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () => _selectAnswer(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: cardColor ?? (isSelected ? widget.color.withOpacity(0.1) : Colors.white),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: cardColor ?? (isSelected ? widget.color : Colors.grey[300]!),
                                width: 2,
                              ),
                              boxShadow: [
                                if (isSelected && !showResult)
                                  BoxShadow(
                                    color: widget.color.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: cardColor != null
                                        ? Colors.white
                                        : (isSelected ? widget.color : Colors.grey[200]),
                                  ),
                                  child: Center(
                                    child: showResult && ((isSelected && isCorrect) || (!isSelected && isCorrect))
                                        ? const Icon(Icons.check, color: Colors.green, size: 20)
                                        : showResult && isSelected && !isCorrect
                                        ? const Icon(Icons.close, color: Colors.red, size: 20)
                                        : Text(
                                      String.fromCharCode(65 + index),
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    question.options[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                      color: cardColor != null ? Colors.white : Colors.grey[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 100), // Extra space at bottom for button clearance
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: !_isAnswered ? null : _nextOrFinish,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    currentQuestion < widget.questions.length - 1 ? 'Next Question' : 'Finish Quiz',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// // lib/screens/quiz/quiz_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/topic_model.dart';
// import '../../services/progress_service.dart';
//
// class QuizScreen extends StatelessWidget {
//   QuizScreen({super.key});  // ← Removed 'const'
//
//   final Map<String, List<QuizQuestion>> quizzes = {
//     'intro': [
//       QuizQuestion(
//         question: 'What is Flutter?',
//         options: ['UI toolkit', 'Programming language', 'Database', 'Operating system'],
//         correctIndex: 0,
//       ),
//     ],
//     'dart': [
//       QuizQuestion(
//         question: 'Dart is mainly used for?',
//         options: ['Web only', 'Client-optimized apps', 'Databases', 'Operating systems'],
//         correctIndex: 1,
//       ),
//     ],
//     'widgets': [
//       QuizQuestion(
//         question: 'In Flutter, everything is a ____.',
//         options: ['Function', 'Widget', 'Class', 'Package'],
//         correctIndex: 1,
//       ),
//     ],
//     'layout': [  // Added more quizzes for completeness
//       QuizQuestion(
//         question: 'Which widget is used for horizontal layout?',
//         options: ['Column', 'Row', 'Stack', 'ListView'],
//         correctIndex: 1,
//       ),
//     ],
//     'navigation': [
//       QuizQuestion(
//         question: 'What is used to push a new screen?',
//         options: ['Navigator.push', 'setState', 'Provider', 'FutureBuilder'],
//         correctIndex: 0,
//       ),
//     ],
//     'state': [
//       QuizQuestion(
//         question: 'What method rebuilds the UI in StatefulWidget?',
//         options: ['initState', 'dispose', 'setState', 'build'],
//         correctIndex: 2,
//       ),
//     ],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Quiz Section')),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: quizzes.keys.map((topicId) {
//           return Card(
//             child: ListTile(
//               leading: const Icon(Icons.quiz_outlined),  // Added for UX
//               title: Text('Quiz: ${topicId.toUpperCase()}'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => TopicQuizScreen(
//                       topicId: topicId,
//                       questions: quizzes[topicId]!,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
//
// class TopicQuizScreen extends StatefulWidget {
//   final String topicId;
//   final List<QuizQuestion> questions;
//
//   const TopicQuizScreen({
//     super.key,
//     required this.topicId,
//     required this.questions,
//   });
//
//   @override
//   State<TopicQuizScreen> createState() => _TopicQuizScreenState();
// }
//
// class _TopicQuizScreenState extends State<TopicQuizScreen> {
//   int currentQuestion = 0;
//   int score = 0;
//   late List<int?> selectedAnswers;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedAnswers = List<int?>.filled(widget.questions.length, null);
//   }
//
//   void _selectAnswer(int index) {
//     if (selectedAnswers[currentQuestion] != null) return;
//
//     setState(() {
//       selectedAnswers[currentQuestion] = index;
//       if (index == widget.questions[currentQuestion].correctIndex) {
//         score++;
//       }
//     });
//   }
//
//   void _nextOrFinish() {
//     if (currentQuestion < widget.questions.length - 1) {
//       setState(() {
//         currentQuestion++;
//       });
//     } else {
//       _submitQuiz();
//     }
//   }
//
//   void _submitQuiz() {
//     final progress = Provider.of<ProgressService>(context, listen: false);
//     progress.saveQuizScore(widget.topicId, score);
//
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Result'),
//         content: Text('Score: $score / ${widget.questions.length}'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // close dialog
//               Navigator.pop(context); // back to quiz list
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final question = widget.questions[currentQuestion];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Question ${currentQuestion + 1} / ${widget.questions.length}'),  // Added progress in title for UX
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               question.question,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 24),
//             ...List.generate(question.options.length, (index) {
//               return RadioListTile<int>(
//                 title: Text(question.options[index]),
//                 value: index,
//                 groupValue: selectedAnswers[currentQuestion],
//                 onChanged: (val) {
//                   if (val != null) _selectAnswer(val);
//                 },
//               );
//             }),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: selectedAnswers[currentQuestion] == null ? null : _nextOrFinish,
//                 child: Text(
//                   currentQuestion < widget.questions.length - 1 ? 'Next' : 'Finish',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }