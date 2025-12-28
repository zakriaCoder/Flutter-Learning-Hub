// lib/screens/learning/learning_screen.dart
import 'package:flutter/material.dart';
import '../../models/topic_model.dart';
import '../lesson/lesson_screen.dart';

class LearningScreen extends StatelessWidget {
  final List<Topic> topics;

  const LearningScreen({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Learning Modules',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF1A1F36),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 600;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              final topic = topics[index];

              // Color palette for different topics
              final colors = [
                const Color(0xFF6C5CE7),
                const Color(0xFF00B894),
                const Color(0xFFFF6B6B),
                const Color(0xFF4834DF),
                const Color(0xFFFD79A8),
                const Color(0xFF00CEC9),
              ];
              final cardColor = colors[index % colors.length];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: cardColor.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LessonScreen(topic: topic),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // Colored icon container
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: cardColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.book_rounded,
                              color: cardColor,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Text content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topic.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A1F36),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  topic.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Arrow indicator
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: cardColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: cardColor,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// // lib/screens/learning/learning_screen.dart
// import 'package:flutter/material.dart';
// import '../../models/topic_model.dart';
// import '../lesson/lesson_screen.dart';
//
// class LearningScreen extends StatelessWidget {
//   final List<Topic> topics;
//
//   const LearningScreen({super.key, required this.topics});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Learning Modules')),
//       body: LayoutBuilder(  // Added for responsive UX
//         builder: (context, constraints) {
//           bool isWide = constraints.maxWidth > 600;
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: topics.length,
//             itemBuilder: (context, index) {
//               final topic = topics[index];
//               return Card(
//                 margin: const EdgeInsets.only(bottom: 12),
//                 child: ListTile(
//                   leading: const Icon(Icons.book, color: Colors.blue),  // Added icon for UX
//                   title: Text(topic.title),
//                   subtitle: Text(
//                     topic.description,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   trailing: const Icon(Icons.arrow_forward_ios),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => LessonScreen(topic: topic),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }