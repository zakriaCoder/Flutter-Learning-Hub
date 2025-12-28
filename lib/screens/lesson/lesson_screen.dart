// lib/screens/lesson/lesson_screen.dart

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import '../../services/progress_service.dart';
import '../../models/topic_model.dart';

class LessonScreen extends StatefulWidget {
  final Topic topic;

  const LessonScreen({super.key, required this.topic});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    _controller.loadVideoById(videoId: widget.topic.youtubeId);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F7FA),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              onPressed: () => Navigator.pop(context),
              color: const Color(0xFF1A1F36),
            ),
            title: Text(
              widget.topic.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF1A1F36),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: Material(
                  color: const Color(0xFF6C5CE7).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: _markComplete,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xFF6C5CE7),
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Complete',
                            style: TextStyle(
                              color: Color(0xFF6C5CE7),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth > 600;
              final horizontalPadding = isTablet ? 40.0 : 20.0;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video Player Section
                    Container(
                      color: Colors.black,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: isTablet ? 800 : double.infinity,
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: player,
                          ),
                        ),
                      ),
                    ),

                    // Content Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Topic Title Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF6C5CE7).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.play_circle_outline_rounded,
                                        color: Color(0xFF6C5CE7),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Lesson Content',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Divider(color: Colors.grey[200], height: 1),
                                const SizedBox(height: 16),

                                // Markdown Content
                                FutureBuilder<String>(
                                  future: DefaultAssetBundle.of(context)
                                      .loadString('assets/content/${widget.topic.id}.md'),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return MarkdownBody(
                                        data: snapshot.data!,
                                        selectable: true,
                                        styleSheet: MarkdownStyleSheet(
                                          p: const TextStyle(
                                            fontSize: 16,
                                            height: 1.7,
                                            color: Color(0xFF4A5568),
                                            letterSpacing: 0.2,
                                          ),
                                          h1: const TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1A1F36),
                                            height: 1.3,
                                          ),
                                          h2: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1A1F36),
                                            height: 1.3,
                                          ),
                                          h3: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF2D3748),
                                            height: 1.3,
                                          ),
                                          code: const TextStyle(
                                            fontFamily: 'monospace',
                                            fontSize: 14,
                                            backgroundColor: Color(0xFFF7FAFC),
                                            color: Color(0xFFD63384),
                                          ),
                                          codeblockDecoration: BoxDecoration(
                                            color: const Color(0xFF1A1F36),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: const Color(0xFF6C5CE7).withOpacity(0.2),
                                              width: 1,
                                            ),
                                          ),
                                          codeblockPadding: const EdgeInsets.all(16),
                                          blockquote: TextStyle(
                                            color: Colors.grey[600],
                                            fontStyle: FontStyle.italic,
                                          ),
                                          blockquoteDecoration: BoxDecoration(
                                            color: const Color(0xFF6C5CE7).withOpacity(0.05),
                                            borderRadius: BorderRadius.circular(8),
                                            border: const Border(
                                              left: BorderSide(
                                                color: Color(0xFF6C5CE7),
                                                width: 4,
                                              ),
                                            ),
                                          ),
                                          listBullet: const TextStyle(
                                            color: Color(0xFF6C5CE7),
                                            fontSize: 16,
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.red.withOpacity(0.3),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.error_outline, color: Colors.red),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                'Error loading content: ${snapshot.error}',
                                                style: const TextStyle(color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(32),
                                        child: Column(
                                          children: const [
                                            CircularProgressIndicator(
                                              color: Color(0xFF6C5CE7),
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              'Loading content...',
                                              style: TextStyle(
                                                color: Color(0xFF718096),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _markComplete() async {
    final progressService = Provider.of<ProgressService>(context, listen: false);
    await progressService.markTopicComplete(widget.topic.id);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.celebration_rounded, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Topic marked as complete! 🎉',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF00B894),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          elevation: 4,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

// // lib/screens/lesson/lesson_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:provider/provider.dart';
// import '../../services/progress_service.dart';
// import '../../models/topic_model.dart';
//
// class LessonScreen extends StatefulWidget {
//   final Topic topic;
//
//   const LessonScreen({super.key, required this.topic});
//
//   @override
//   State<LessonScreen> createState() => _LessonScreenState();
// }
//
// class _LessonScreenState extends State<LessonScreen> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       params: const YoutubePlayerParams(
//         showControls: true,
//         showFullscreenButton: true,
//       ),
//     );
//     _controller.loadVideoById(videoId: widget.topic.youtubeId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerScaffold(
//       controller: _controller,
//       builder: (context, player) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(widget.topic.title),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.check_circle_outline),
//                 tooltip: 'Mark as Complete',
//                 onPressed: _markComplete,
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: player,
//                 ),
//                 const SizedBox(height: 24),
//                 FutureBuilder<String>(
//                   future: DefaultAssetBundle.of(context)
//                       .loadString('assets/content/${widget.topic.id}.md'),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return MarkdownBody(
//                         data: snapshot.data!,
//                         selectable: true,
//                         styleSheet: MarkdownStyleSheet(
//                           p: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
//                           h1: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
//                           h2: Theme.of(context).textTheme.titleLarge,
//                           h3: Theme.of(context).textTheme.titleMedium,
//                           code: const TextStyle(fontFamily: 'monospace', fontSize: 14),
//                           codeblockDecoration: BoxDecoration(
//                             color: Theme.of(context).brightness == Brightness.dark
//                                 ? Colors.grey[800]
//                                 : Colors.grey[100],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('Error loading content: ${snapshot.error}');
//                     }
//                     return const Center(child: CircularProgressIndicator());
//                   },
//                 ),
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> _markComplete() async {
//     final progressService = Provider.of<ProgressService>(context, listen: false);
//     await progressService.markTopicComplete(widget.topic.id);
//
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Topic marked as complete! 🎉'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }
// }
//
//
// // // lib/screens/lesson/lesson_screen.dart
// //
// // import 'package:flutter/material.dart';
// // import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// // import 'package:provider/provider.dart';
// // import '../../services/progress_service.dart';
// // import '../../models/topic_model.dart';
// //
// // class LessonScreen extends StatefulWidget {
// //   final Topic topic;
// //
// //   const LessonScreen({super.key, required this.topic});
// //
// //   @override
// //   State<LessonScreen> createState() => _LessonScreenState();
// // }
// //
// // class _LessonScreenState extends State<LessonScreen> {
// //   late YoutubePlayerController _controller;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = YoutubePlayerController(
// //       params: const YoutubePlayerParams(
// //         showControls: true,
// //         showFullscreenButton: true,
// //         mute: false,
// //         loop: false,
// //         enableCaption: true,
// //         captionLanguage: 'en',
// //       ),
// //     );
// //
// //     // Load the YouTube video using the correct named parameter
// //     _controller.loadVideoById(videoId: widget.topic.youtubeId);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return YoutubePlayerScaffold(
// //       controller: _controller,
// //       builder: (context, player) {
// //         return Scaffold(
// //           appBar: AppBar(
// //             title: Text(widget.topic.title),
// //             actions: [
// //               IconButton(
// //                 icon: const Icon(Icons.check_circle_outline),
// //                 tooltip: 'Mark as Complete',
// //                 onPressed: _markComplete,
// //               ),
// //             ],
// //           ),
// //           body: SingleChildScrollView(
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // YouTube Player
// //                 AspectRatio(
// //                   aspectRatio: 16 / 9,
// //                   child: player,
// //                 ),
// //                 const SizedBox(height: 24),
// //
// //                 // Lesson Description
// //                 Text(
// //                   widget.topic.description,
// //                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
// //                     height: 1.5,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 32),
// //
// //                 // Code Snippet Section
// //                 Text(
// //                   'Code Snippet:',
// //                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Container(
// //                   width: double.infinity,
// //                   padding: const EdgeInsets.all(16),
// //                   decoration: BoxDecoration(
// //                     color: Theme.of(context).brightness == Brightness.dark
// //                         ? Colors.grey[800]
// //                         : Colors.grey[100],
// //                     borderRadius: BorderRadius.circular(12),
// //                     border: Border.all(
// //                       color: Theme.of(context).dividerColor.withOpacity(0.2),
// //                     ),
// //                   ),
// //                   child: SelectableText(
// //                     widget.topic.codeSnippet,
// //                     style: const TextStyle(
// //                       fontFamily: 'monospace',
// //                       fontSize: 14,
// //                       height: 1.4,
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 40),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Future<void> _markComplete() async {
// //     final progressService = Provider.of<ProgressService>(context, listen: false);
// //     await progressService.markTopicComplete(widget.topic.id);
// //
// //     if (mounted) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Topic marked as complete! 🎉'),
// //           backgroundColor: Colors.green,
// //           duration: Duration(seconds: 2),
// //         ),
// //       );
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.close();
// //     super.dispose();
// //   }
// // }