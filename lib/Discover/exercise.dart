// // // import 'package:flutter/material.dart';
// // // import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// // // void main() {
// // //   runApp(const MindfulnessApp());
// // // }

// // // class MindfulnessApp extends StatelessWidget {
// // //   const MindfulnessApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         primaryColor: const Color(0xFF5A639C),
// // //         scaffoldBackgroundColor: const Color(0xFFE2BBE9),
// // //       ),
// // //       home: const MindfulnessHomePage(),
// // //     );
// // //   }
// // // }

// // // class MindfulnessHomePage extends StatelessWidget {
// // //   const MindfulnessHomePage({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         elevation: 0,
// // //         flexibleSpace: Container(
// // //           decoration: const BoxDecoration(
// // //             gradient: LinearGradient(
// // //               colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
// // //               begin: Alignment.topLeft,
// // //               end: Alignment.bottomRight,
// // //             ),
// // //           ),
// // //         ),
// // //         title: const Text(
// // //           "Mindfulness & Yoga",
// // //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
// // //         ),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             const Text(
// // //               "Trending Videos 🔥",
// // //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
// // //             ),
// // //             const SizedBox(height: 15),
// // //             Expanded(
// // //               child: ListView(
// // //                 children: const [
// // //                   VideoCard(videoId: "VvXRXRYsTWg", title: "10-Min Yoga for Beginners"),
// // //                   VideoCard(videoId: "O-6f5wQXSu8", title: "Mindfulness Meditation"),
// // //                   VideoCard(videoId: "ZToicYcHIOU", title: "Breathing Techniques"),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class VideoCard extends StatefulWidget {
// // //   final String videoId;
// // //   final String title;

// // //   const VideoCard({super.key, required this.videoId, required this.title});

// // //   @override
// // //   _VideoCardState createState() => _VideoCardState();
// // // }

// // // class _VideoCardState extends State<VideoCard> {
// // //   late YoutubePlayerController _controller;
// // //   bool _isPlaying = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _controller = YoutubePlayerController(
// // //       initialVideoId: widget.videoId,
// // //       flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Card(
// // //       elevation: 5,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// // //       margin: const EdgeInsets.symmetric(vertical: 12),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(12.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             GestureDetector(
// // //               onTap: () {
// // //                 setState(() {
// // //                   _isPlaying = true;
// // //                 });
// // //               },
// // //               child: ClipRRect(
// // //                 borderRadius: BorderRadius.circular(12),
// // //                 child: _isPlaying
// // //                     ? YoutubePlayerBuilder(
// // //                         player: YoutubePlayer(controller: _controller),
// // //                         builder: (context, player) {
// // //                           return player;
// // //                         },
// // //                       )
// // //                     : Stack(
// // //                         alignment: Alignment.center,
// // //                         children: [
// // //                           Image.network(
// // //                             "https://img.youtube.com/vi/${widget.videoId}/hqdefault.jpg",
// // //                             fit: BoxFit.cover,
// // //                             width: double.infinity,
// // //                           ),
// // //                           const Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
// // //                         ],
// // //                       ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             Text(
// // //               widget.title,
// // //               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _controller.dispose();
// // //     super.dispose();
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// // void main() {
// //   runApp(const MindfulnessApp());
// // }

// // class MindfulnessApp extends StatelessWidget {
// //   const MindfulnessApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primaryColor: const Color(0xFF5A639C),
// //         scaffoldBackgroundColor: const Color(0xFFE2BBE9),
// //       ),
// //       home: const MindfulnessHomePage(),
// //     );
// //   }
// // }

// // class MindfulnessHomePage extends StatelessWidget {
// //   const MindfulnessHomePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         elevation: 0,
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //         title: const Text(
// //           "Mindfulness & Yoga",
// //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               "Trending Videos 🔥",
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
// //             ),
// //             const SizedBox(height: 15),
// //             Expanded(
// //               child: ListView(
// //                 children: const [
// //                   VideoCard(videoId: "VvXRXRYsTWg", title: "10-Min Yoga for Beginners"),
// //                   VideoCard(videoId: "O-6f5wQXSu8", title: "Mindfulness Meditation"),
// //                   VideoCard(videoId: "ZToicYcHIOU", title: "Breathing Techniques"),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class VideoCard extends StatefulWidget {
// //   final String videoId;
// //   final String title;

// //   const VideoCard({super.key, required this.videoId, required this.title});

// //   @override
// //   _VideoCardState createState() => _VideoCardState();
// // }

// // class _VideoCardState extends State<VideoCard> {
// //   late YoutubePlayerController _controller;
// //   bool _isPlaying = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = YoutubePlayerController(
// //       initialVideoId: widget.videoId,
// //       flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 5,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //       margin: const EdgeInsets.symmetric(vertical: 12),
// //       child: Padding(
// //         padding: const EdgeInsets.all(12.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             GestureDetector(
// //               onTap: () {
// //                 setState(() {
// //                   _isPlaying = true;
// //                 });
// //               },
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(12),
// //                 child: _isPlaying
// //                     ? YoutubePlayerBuilder(
// //                         player: YoutubePlayer(controller: _controller),
// //                         builder: (context, player) {
// //                           return player;
// //                         },
// //                       )
// //                     : Stack(
// //                         alignment: Alignment.center,
// //                         children: [
// //                           Image.network(
// //                             "https://img.youtube.com/vi/${widget.videoId}/hqdefault.jpg",
// //                             fit: BoxFit.cover,
// //                             width: double.infinity,
// //                           ),
// //                           const Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
// //                         ],
// //                       ),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             Text(
// //               widget.title,
// //               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
// //             ),
// //             const SizedBox(height: 12),
// //             GestureDetector(
// //               onTap: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(content: Text("You tapped on ${widget.title}")),
// //                 );
// //               },
// //               child: Container(
// //                 width: double.infinity,
// //                 padding: const EdgeInsets.symmetric(vertical: 10),
// //                 decoration: BoxDecoration(
// //                   gradient: const LinearGradient(
// //                     colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
// //                     begin: Alignment.topLeft,
// //                     end: Alignment.bottomRight,
// //                   ),
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 alignment: Alignment.center,
// //                 child: const Text(
// //                   "Tap for More Info",
// //                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// void main() {
//   runApp(const MindfulnessApp());
// }

// class MindfulnessApp extends StatelessWidget {
//   const MindfulnessApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(0xFF5A639C),
//         scaffoldBackgroundColor: const Color(0xFFE2BBE9),
//       ),
//       home: const MindfulnessHomePage(),
//     );
//   }
// }

// class MindfulnessHomePage extends StatelessWidget {
//   const MindfulnessHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         title: const Text(
//           "Mindfulness & Yoga",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Trending Videos 🔥",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             const SizedBox(height: 15),
//             Expanded(
//               child: ListView(
//                 children: const [
//                   VideoCard(videoId: "VvXRXRYsTWg", title: "10-Min Yoga for Beginners"),
//                   VideoCard(videoId: "O-6f5wQXSu8", title: "Mindfulness Meditation"),
//                   VideoCard(videoId: "ZToicYcHIOU", title: "Breathing Techniques"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VideoCard extends StatefulWidget {
//   final String videoId;
//   final String title;

//   const VideoCard({super.key, required this.videoId, required this.title});

//   @override
//   _VideoCardState createState() => _VideoCardState();
// }

// class _VideoCardState extends State<VideoCard> {
//   late YoutubePlayerController _controller;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       margin: const EdgeInsets.symmetric(vertical: 12),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _isPlaying = true;
//                 });
//               },
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: _isPlaying
//                     ? YoutubePlayerBuilder(
//                         player: YoutubePlayer(controller: _controller),
//                         builder: (context, player) {
//                           return player;
//                         },
//                       )
//                     : Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Image.network(
//                             "https://img.youtube.com/vi/${widget.videoId}/hqdefault.jpg",
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                           ),
//                           const Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
//                         ],
//                       ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               widget.title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             const SizedBox(height: 12),
//             GestureDetector(
//               onTap: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("You tapped on ${widget.title}")),
//                 );
//               },
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "Tap for More Info",
//                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MindfulnessApp());
}

class MindfulnessApp extends StatelessWidget {
  const MindfulnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF5A639C),
        scaffoldBackgroundColor: const Color(0xFFE2BBE9),
      ),
      home: const MindfulnessHomePage(),
    );
  }
}

class MindfulnessHomePage extends StatelessWidget {
  const MindfulnessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "Mindfulness & Yoga",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trending Videos 🔥",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: const [
                  VideoCard(videoId: "VvXRXRYsTWg", title: "10-Min Yoga for Beginners"),
                  VideoCard(videoId: "O-6f5wQXSu8", title: "Mindfulness Meditation"),
                  VideoCard(videoId: "ZToicYcHIOU", title: "Breathing Techniques"),
                ],
              ),
            ),
            // Separate Clickable Container Below Video List
            ClickableContainer(
              text: "Explore More Quizzes",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Quiz section tapped!")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Video Card Widget
class VideoCard extends StatefulWidget {
  final String videoId;
  final String title;

  const VideoCard({super.key, required this.videoId, required this.title});

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late YoutubePlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = true;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _isPlaying
                    ? YoutubePlayerBuilder(
                        player: YoutubePlayer(controller: _controller),
                        builder: (context, player) {
                          return player;
                        },
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            "https://img.youtube.com/vi/${widget.videoId}/hqdefault.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          const Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Separate Clickable Container Widget
class ClickableContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ClickableContainer({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF5A639C), Color(0xFF7776B3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
