import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoUploader(),
  ));
}

class VideoUploader extends StatefulWidget {
  @override
  _VideoUploaderState createState() => _VideoUploaderState();
}

class _VideoUploaderState extends State<VideoUploader> {
  VideoPlayerController? _controller1;
  VideoPlayerController? _controller2;
  File? videoFile1;
  File? videoFile2;

  Future<void> pickVideo(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      File selectedFile = File(result.files.single.path!);
      setState(() {
        if (index == 1) {
          videoFile1 = selectedFile;
          _controller1 = VideoPlayerController.file(videoFile1!)..initialize().then((_) => setState(() {}));
        } else {
          videoFile2 = selectedFile;
          _controller2 = VideoPlayerController.file(videoFile2!)..initialize().then((_) => setState(() {}));
        }
      });
    }
  }

  @override
  void dispose() {
    _controller1?.dispose();
    _controller2?.dispose();
    super.dispose();
  }

  Widget buildVideoContainer(VideoPlayerController? controller, int index) {
    return GestureDetector(
      onTap: () => pickVideo(index),
      child: Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
        child: controller == null
            ? Center(child: Text("Tap to Upload Video $index"))
            : ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload & Play Videos")),
      body: Column(
        children: [
          SizedBox(height: 20),
          buildVideoContainer(_controller1, 1),
          SizedBox(height: 20),
          buildVideoContainer(_controller2, 2),
        ],
      ),
    );
  }
}

