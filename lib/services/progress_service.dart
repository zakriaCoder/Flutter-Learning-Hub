// lib/services/progress_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressService extends ChangeNotifier {
  static const _completedTopicsKey = 'completed_topics';
  static const _quizScoresKey = 'quiz_scores';

  List<String> _completedTopics = [];
  Map<String, dynamic> _quizScores = {};

  List<String> get completedTopics => _completedTopics;
  Map<String, dynamic> get quizScores => _quizScores;

  ProgressService() {
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    _completedTopics = prefs.getStringList(_completedTopicsKey) ?? [];

    final quizJson = prefs.getString(_quizScoresKey);
    if (quizJson != null && quizJson.isNotEmpty) {
      final decoded = jsonDecode(quizJson) as Map<String, dynamic>;

      // Convert stored data back to proper format with DateTime
      _quizScores = decoded.map((key, value) {
        if (value is Map) {
          return MapEntry(key, {
            'score': value['score'] as int,
            'total': value['total'] as int,
            'timestamp': value['timestamp'] != null
                ? DateTime.parse(value['timestamp'] as String)
                : DateTime.now(),
          });
        }
        // Handle old format (just score as int) for backwards compatibility
        return MapEntry(key, {
          'score': value as int,
          'total': 6, // default
          'timestamp': DateTime.now(),
        });
      });
    }
    notifyListeners();
  }

  Future<void> markTopicComplete(String topicId) async {
    if (!_completedTopics.contains(topicId)) {
      _completedTopics.add(topicId);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_completedTopicsKey, _completedTopics);
      notifyListeners();
    }
  }

  Future<void> saveQuizScore(String topicId, int score, {int totalQuestions = 6}) async {
    _quizScores[topicId] = {
      'score': score,
      'total': totalQuestions,
      'timestamp': DateTime.now(),
    };

    // Convert to JSON-friendly format for storage
    final quizScoresForStorage = _quizScores.map((key, value) {
      return MapEntry(key, {
        'score': value['score'],
        'total': value['total'],
        'timestamp': (value['timestamp'] as DateTime).toIso8601String(),
      });
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_quizScoresKey, jsonEncode(quizScoresForStorage));
    notifyListeners();
  }

  // Get score for a specific topic
  int? getTopicScore(String topicId) {
    return _quizScores[topicId]?['score'] as int?;
  }

  // Get total questions for a specific topic
  int? getTopicTotal(String topicId) {
    return _quizScores[topicId]?['total'] as int?;
  }

  // Get percentage for a specific topic
  double? getTopicPercentage(String topicId) {
    final score = getTopicScore(topicId);
    final total = getTopicTotal(topicId);
    if (score != null && total != null && total > 0) {
      return (score / total) * 100;
    }
    return null;
  }

  // Get timestamp for a specific topic
  DateTime? getTopicTimestamp(String topicId) {
    return _quizScores[topicId]?['timestamp'] as DateTime?;
  }

  // Check if topic quiz has been attempted
  bool hasAttemptedQuiz(String topicId) {
    return _quizScores.containsKey(topicId);
  }

  // Clear all progress (useful for testing or reset feature)
  Future<void> clearAllProgress() async {
    _completedTopics.clear();
    _quizScores.clear();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_completedTopicsKey);
    await prefs.remove(_quizScoresKey);

    notifyListeners();
  }
}

// // lib/services/progress_service.dart
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ProgressService extends ChangeNotifier {
//   static const _completedTopicsKey = 'completed_topics';
//   static const _quizScoresKey = 'quiz_scores';
//
//   List<String> _completedTopics = [];
//   Map<String, int> _quizScores = {};
//
//   List<String> get completedTopics => _completedTopics;
//   Map<String, int> get quizScores => _quizScores;
//
//   ProgressService() {
//     _loadProgress();
//   }
//
//   Future<void> _loadProgress() async {
//     final prefs = await SharedPreferences.getInstance();
//     _completedTopics = prefs.getStringList(_completedTopicsKey) ?? [];
//     final quizJson = prefs.getString(_quizScoresKey);
//     if (quizJson != null && quizJson.isNotEmpty) {
//       final decoded = jsonDecode(quizJson) as Map<String, dynamic>;
//       _quizScores = decoded.map((k, v) => MapEntry(k, v as int));
//     }
//     notifyListeners();
//   }
//
//   Future<void> markTopicComplete(String topicId) async {
//     if (!_completedTopics.contains(topicId)) {
//       _completedTopics.add(topicId);
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setStringList(_completedTopicsKey, _completedTopics);
//       notifyListeners();
//     }
//   }
//
//   Future<void> saveQuizScore(String topicId, int score) async {
//     _quizScores[topicId] = score;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_quizScoresKey, jsonEncode(_quizScores));
//     notifyListeners();
//   }
// }