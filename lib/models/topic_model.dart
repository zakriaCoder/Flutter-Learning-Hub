// lib/models/topic_model.dart
class Topic {
  final String id;
  final String title;
  final String description;
  final String codeSnippet;
  final String youtubeId;

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.codeSnippet,
    required this.youtubeId,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}